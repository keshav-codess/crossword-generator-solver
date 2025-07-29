package com.crossword.servlets;

import java.io.IOException;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/solve")
public class SolveCrosswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String crosswordInput = request.getParameter("crossword");
        String wordsInput = request.getParameter("words");

        if (crosswordInput == null || crosswordInput.trim().isEmpty() || 
            wordsInput == null || wordsInput.trim().isEmpty()) {
            request.setAttribute("crossword", "<p class='text-danger'>❌ Please provide both grid and words!</p>");
            request.getRequestDispatcher("solve-result.jsp").forward(request, response);
            return;
        }

        //  grid to 2D array 
        String[] rows = crosswordInput.trim().split("\n");
        int rowCount = rows.length;
        int colCount = Arrays.stream(rows).mapToInt(r -> r.trim().split("\\s+").length).max().orElse(0);

        char[][] grid = new char[rowCount][colCount];
        for (int i = 0; i < rowCount; i++) {
            String[] letters = rows[i].trim().split("\\s+");
            for (int j = 0; j < colCount; j++) {
                grid[i][j] = (j < letters.length) ? letters[j].charAt(0) : '_';
            }
        }

        //  user-entered words
        String[] words = wordsInput.toUpperCase().split("\\s*,\\s*");
        boolean[][] highlight = new boolean[rowCount][colCount];
        List<String> foundInfo = new ArrayList<>();

        for (String word : words) {
            if (findWord(grid, word, highlight, foundInfo)) {
                foundInfo.add("✅ " + word + " found!");
            }
             else {
                foundInfo.add("❌ " + word + " not found!");
            }
        }

        // Build HTML grid 
        StringBuilder gridHtml = new StringBuilder("<table class='crossword'>");
        for (int i = 0; i < rowCount; i++) {
            gridHtml.append("<tr>");
            for (int j = 0; j < colCount; j++) {
                if (highlight[i][j]) {
                    gridHtml.append("<td class='highlight'>").append(grid[i][j]).append("</td>");
                } else {
                    gridHtml.append("<td>").append(grid[i][j]).append("</td>");
                }
            }
            gridHtml.append("</tr>");
        }
        gridHtml.append("</table>");

        request.setAttribute("crossword", gridHtml.toString());
        request.setAttribute("foundInfo", foundInfo);
        request.getRequestDispatcher("solve-result.jsp").forward(request, response);
    }

    // word search logic 
    private boolean findWord(char[][] grid, String word, boolean[][] highlight, List<String> foundInfo) {
        int rows = grid.length;
        int cols = grid[0].length;
        int[] dx = {-1, -1, -1, 0, 0, 1, 1, 1};
        int[] dy = {-1, 0, 1, -1, 1, -1, 0, 1};

        for (int x = 0; x < rows; x++) {
            for (int y = 0; y < cols; y++) {
                for (int dir = 0; dir < 8; dir++) {
                    if (searchDirection(grid, word, x, y, dx[dir], dy[dir], highlight)) {
                        foundInfo.add("📍 " + word + " starts at (" + (x + 1) + "," + (y + 1) + ")");
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private boolean searchDirection(char[][] grid, String word, int x, int y, int dx, int dy, boolean[][] highlight) {
        int rows = grid.length;
        int cols = grid[0].length;
        int len = word.length();

        int nx = x, ny = y;
        for (int i = 0; i < len; i++) {
            if (nx < 0 || ny < 0 || nx >= rows || ny >= cols || grid[nx][ny] != word.charAt(i)) {
                return false;
            }
            nx += dx;
            ny += dy;
        }

        // highlight found word
        nx = x;
        ny = y;
        for (int i = 0; i < len; i++) {
            highlight[nx][ny] = true;
            nx += dx;
            ny += dy;
        }
        return true;
    }
}
