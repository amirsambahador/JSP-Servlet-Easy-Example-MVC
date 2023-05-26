<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: amirs
  Date: 5/26/2023
  Time: 12:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/head.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp"/>

<div id="container" class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">Desktop</div>
        <div class="panel-body">
            <form action="/person/save.do">
                <input type="text" name="name" class="form-control"/>
                <br/>
                <input type="text" name="family" class="form-control"/>
                <br/>
                <input type="text" name="salary" class="form-control"/>
                <br/>
                <input type="submit" style="width: 100%" value="SAVE" class="btn btn-primary"/>
            </form>

            <table class="table table-striped table-responsive table-hover" style="width: 100%">
                <tr>
                    <td>ID</td>
                    <td>NAME</td>
                    <td>FAMILY</td>
                    <td>SALARY</td>
                    <td>OPER</td>
                    <td>OPER</td>
                </tr>

                <c:forEach items="${requestScope.list}" var="person">
                    <form action="/person/update.do">
                        <tr>
                            <td><input class="form-control" type="text" name="id" value="${person.id}" readonly/></td>
                            <td><input class="form-control" type="text" name="name" value="${person.name}"/></td>
                            <td><input class="form-control" type="text" name="family" value="${person.family}"/></td>
                            <td><input class="form-control" type="text" name="salary" value="${person.salary}"/></td>
                            <td><input class="btn btn-primary" type="submit" value="UPDATE"/></td>
                            <td><input type="button" class="btn btn-danger" onclick="removePerson(${person.id})"
                                       value="REMOVE"/></td>
                        </tr>
                    </form>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>
    function removePerson(id) {
        if (confirm('are you sure?'))
            window.location = '/person/remove.do?id=' + id;
    }
</script>
</body>
</html>
