package fr.ubdx.net.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/api/reservation")
public class ReservationApiServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String datetime = req.getParameter("datetime");
        String people = req.getParameter("people");

        // Here we would normally store it via ReservationStorage.getInstance().add(...)
        // But for mock purposes, we just redirect or confirm
        resp.setContentType("text/html;charset=UTF-8");
        resp.getWriter().println("<h1>Réservation confirmée pour " + name + " !</h1>");
        resp.getWriter().println("<a href='../index.jsp'>Retour</a>");
    }
}