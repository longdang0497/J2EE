<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Provider List</title>
    <%@include file="fragment/importLibs.jsp" %>
</head>
<body>
<div class="wrapper ">
    <!-- Sidebar (hidden by default) -->
    <%@include file="fragment/sidebar.jsp"%>
    <div class="main-panel">
        <!-- Top menu -->
        <%@include file="fragment/header.jsp"%>

        <!-- PAGE CONTENT -->
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">MANAGE PROVIDERS</h5>
                        </div>
                        <c:set var = "maPQ" scope = "session" value = "${authorityObject.getAuthority().getMaPQ()}"/>
                        <c:set var = "maNV" scope = "session" value = "${authorityObject.getEmployee().getMaNV()}"/>
                        <div>
                            <form class="card-body" method="post" onsubmit="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/provider&save'); window.history.go();">
                                <table>
                                    <tr>
                                        <td>
                                            <input type="hidden" name="maNCC" class="form-control"/>
                                            <label class="segment-lb">Name</label>
                                            <input type="text" name="tenNCC" required="" class="form-control"/>
                                        </td>
                                        <td>
                                            <label class="segment-lb">Address</label>
                                            <input type="text" name="diaChiNCC" required="" class="form-control"/>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td class="form-list__row">
                                            <label class="segment-lb">Phone</label>
                                            <input type="text" name="soDTNCC" required="" class="form-control"/>
                                        </td>
                                        <td>
                                            <label class="segment-lb">Email</label>
                                            <input type="text" name="emailNCC" required="" class="form-control"/>
                                        </td>
                                    </tr>
                                </table>
                                <input type="submit" class="btn btn-primary btn-round" value="SAVE" onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/provider'); window.history.go();"/>
                                <input type="button" class="btn btn-primary btn-round" value="REFRESH" onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/provider'); window.history.go();"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead class=" text-primary">
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="list" items="${providerLists}">
                                        <tr>
                                            <td>${list.maNCC}</td>
                                            <td>${list.tenNCC}</td>
                                            <td>${list.diaChiNCC}</td>
                                            <td>${list.emailNCC}</td>
                                            <td>${list.soDTNCC}</td>
                                            <td>
                                                <a id="btn-delete" onclick="if (confirm('Do you want to delete this?')) window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/provider/delete/${list.maNCC}'); window.history.go();">Delete</a>
                                                <a onclick="window.history.replaceState({}, document.title, '/' + 'role=${maPQ}/nv=${maNV}/viewProvider/${list.maNCC}'); window.history.go();">Edit</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <%@include file="fragment/footer.jsp"%>
</div>

<!-- JS -->
<%@include file="fragment/importJS.jsp"%>

<!-- End page content -->
<script>
    $(document).ready(function () {
        $('#nav_provider').addClass('active');
    });
</script>
</div>

</div>

<!-- Footer -->
<%@include file="fragment/footer.jsp" %>

<!-- End page content -->
</body>
</html>