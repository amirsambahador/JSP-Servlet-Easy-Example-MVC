package org.j2os.controller.person;

import org.j2os.entity.Person;
import org.j2os.service.PersonService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/person/update.do")
public class Update extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Person person = new Person(Long.parseLong(req.getParameter("id")), req.getParameter("name"), req.getParameter("family"), Long.parseLong(req.getParameter("salary")));
            PersonService.getInstance().update(person);
            resp.sendRedirect("/person/findAll.do");
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            resp.sendError(701);
        }
    }
}
