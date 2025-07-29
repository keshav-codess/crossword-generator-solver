package com.crossword.servlets;

import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/generate")
public class GenerateCrosswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Random random = new Random();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String wordsInput = request.getParameter("words");
        String gridSizeParam = request.getParameter("gridSize"); 

        if (wordsInput == null || wordsInput.trim().isEmpty()) {
            request.setAttribute("crossword", "❌ Please enter some words!");
            request.getRequestDispatcher("result.jsp").forward(request, response);
            return;
        }

        // calculate dynamic grid size
        String[] words = wordsInput.toUpperCase().split("\\s*,\\s*");
        int longestWord = 0;
        for (String word : words) longestWord = Math.max(longestWord, word.length());

        int gridSize = (gridSizeParam != null && !gridSizeParam.isEmpty()) ? Integer.parseInt(gridSizeParam) : Math.max(longestWord + 3, 10); 
        char[][] grid = new char[gridSize][gridSize];

        // initialize grid with empty cells
        for (int i = 0; i < gridSize; i++) {
            for (int j = 0; j < gridSize; j++) {
                grid[i][j] = '_';
            }
        }

        // place words dynamically
        for (String word : words) {
            placeWordInGrid(grid, word);
        }

        // fill remaining empty spaces 
        for (int i = 0; i < gridSize; i++) {
            for (int j = 0; j < gridSize; j++) {
                if (grid[i][j] == '_') {
                    grid[i][j] = (char) ('A' + random.nextInt(26));
                }
            }
        }

        // build grid 
        StringBuilder gridHtml = new StringBuilder("<table class='crossword'>");
        for (int i = 0; i < gridSize; i++) {
            gridHtml.append("<tr>");
            for (int j = 0; j < gridSize; j++) {
                gridHtml.append("<td>").append(grid[i][j]).append("</td>");
            }
            gridHtml.append("</tr>");
        }
        gridHtml.append("</table>");

        request.setAttribute("crossword", gridHtml.toString());
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    private void placeWordInGrid(char[][] grid, String word) {
        int n = grid.length;
        int[] dx = {-1, -1, -1, 0, 0, 1, 1, 1};
        int[] dy = {-1, 0, 1, -1, 1, -1, 0, 1};

        boolean placed = false;
        int attempts = 0;
        while (!placed && attempts < 100) { 
            int row = random.nextInt(n);
            int col = random.nextInt(n);
            int dir = random.nextInt(8);

            if (canPlace(grid, word, row, col, dx[dir], dy[dir])) {
                for (int k = 0; k < word.length(); k++) {
                    grid[row][col] = word.charAt(k);
                    row += dx[dir];
                    col += dy[dir];
                }
                placed = true;
            }
            attempts++;
        }
    }

    private boolean canPlace(char[][] grid, String word, int row, int col, int dx, int dy) {
        int n = grid.length;
        for (int k = 0; k < word.length(); k++) {
            if (row < 0 || col < 0 || row >= n || col >= n) return false;
            if (grid[row][col] != '_' && grid[row][col] != word.charAt(k)) return false;
            row += dx;
            col += dy;
        }
        return true;
    }
}
