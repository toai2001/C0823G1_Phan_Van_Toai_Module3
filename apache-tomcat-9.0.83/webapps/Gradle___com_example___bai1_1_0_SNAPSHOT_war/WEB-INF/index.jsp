<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head th:include="/template/header.html"></head>
<body>

<div class="container">
    <a class="btn btn-primary my-3" th:href="@{/product/add}" role="button">Add new Product</a>
    <table class="table mt-3">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col" colspan="3">Action</th>
        </tr>
        </thead>
        <tbody>
        <tr th:each="product,loop : ${products}">
            <th th:text="${loop.count}" scope="row">1</th>
            <td th:text="${product.name}">Mark</td>
            <td th:text="${product.description}">Otto</td>
            <td th:text="${product.price +' usd'}">@mdo</td>
            <td><a role="button" class="btn btn-primary" th:href="@{/product/__${product.id}__/view}">View</a></td>
            <td><a role="button" class="btn btn-warning" th:href="@{/product/__${product.id}__/edit}">Edit</a></td>
            <td>
                <button th:onclick="'javascript:sendData(\'' + ${product.id}+'\',\''+${product.name} + '\');'" type="button" class="btn btn-danger"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Detele
                </button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Notification</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modal-body-delete">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a role="button" id="del-product" class="btn btn-danger">Corfirm</a>
            </div>
        </div>
    </div>
</div>
<script>
    function sendData(id, name) {
        console.log(id);
        console.log(name);
        document.getElementById("modal-body-delete").innerHTML = "You definitely want to delete the product " + name;
        document.getElementById("del-product").href = "/product/" + id + "/delete";
    }
</script>
<footer th:include="/template/footer.html"></footer>
</body>
</html>