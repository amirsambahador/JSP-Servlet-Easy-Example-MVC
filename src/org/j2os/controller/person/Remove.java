package org.j2os.controller.person;

import org.j2os.entity.Person;
import org.j2os.service.PersonService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/person/remove.do")
public class Remove extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Person person = new Person().setId(Long.parseLong(req.getParameter("id")));
            PersonService.getInstance().remove(person);
            resp.sendRedirect("/person/findAll.do");
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            resp.sendError(701);
        }
    }
}
