
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<tn:styles/>
<body id="page-top">
<tn:navi title="Hardware store"/>
<section class="page-section"/>
<section class="page-section">
    <div class="container">

        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Search</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>

        <div class="row">
            <div class="col-lg-8 mx-auto">
                <form method="POST" id="searchForm" name="sentMessage">
                    <div class="control-group">
                        <div class="form-group floating-label-form-group controls mb-0 pb-2">
                            <label>Enter</label>
                            <input type="text" placeholder="Find..." name="find_text">
                        </div>
                    </div>
                    <br />
                    <div id="success"></div>
                    <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4 mb-5">
                        <button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit" name= "byname">Find by product name</button>
                    </div>
                   <!--  <div class="col-md-6 col-lg-4 mb-5">
                        <button class="btn btn-primary btn-xl" id="sendMessageButton1" type="submit" name= "bycompany">Find product by company</button>
                    </div> -->
                    <c:if test="${not empty companies}">
                        <div class="col-md-6 col-lg-4 mb-5">
                            <select class="btn btn-primary btn-xl" id="sendMessageButton12" type="submit" name="bycompany" onchange="this.form.submit()">
                                <option value="" disabled selected>Find product by company</option>
                                <c:forEach items="${companies}" var="company">
                                    <option value="${company}">${company}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:if>
                    </div>
                </form>
            </div>
        </div>
</section>
<c:if test="${not empty products}">

    <section class="page-section portfolio" id="portfolio">
        <div class="container">
            <!-- Portfolio Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Products</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Portfolio Grid Items-->
            <div class="row justify-content-center">
                <c:forEach items="${products}" var="product">
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                            <img class="img-fluid" src="${product.image}" alt="${product.description}" />
                            <p class="lead">Name: ${product.name}</p>
                            <p class="lead">Description: ${product.description}</p>
                            <p class="lead">StockLevel: ${product.stockLevel}</p>
                            <p class="lead">Price: <font color="red">${product.price}</font></p>
                            <p class="lead">Company: ${product.user.companyName}</p>
                            <p class="lead">Contact: ${product.user.contact}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</c:if>
<tn:footer/>
</body>
</html>
