package fr.ubdx.net.servlet;

import fr.ubdx.net.model.Sushi;
import fr.ubdx.net.model.SushiStorage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/menu")
public class MenuApiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        List<Sushi> sushis = SushiStorage.getInstance().getSushis();
        
        PrintWriter out = resp.getWriter();
        out.print("[");
        for (int i = 0; i < sushis.size(); i++) {
            Sushi s = sushis.get(i);
            out.print("{\"id\":\"" + s.getId() + "\", \"name\":\"" + s.getName() + "\", \"price\":" + s.getPrice() + "}");
            if (i < sushis.size() - 1) out.print(",");
        }
        out.print("]");
        out.flush();
    }
}