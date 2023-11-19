<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Produtos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    </head>
    <h1 class="mt-3">Lista de Produtos</h1>
    <body class="container"> 
        <a href="CadastroFC?acao=incProd" class="btn btn-primary m-2">Novo Produto</a> 
        <table class="table table-striped mt-3"> 
            <thead class="thead-dark"> 
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Preço de Venda</th>
                    <th scope="col">Opções</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${lista}">
                    <tr>
                        <td>${p.idProduto}</td>
                        <td>${p.nome}</td>
                        <td>${p.quantidade}</td>
                        <td>${p.precoVenda}</td> 
                        <td>
                            <a href="CadastroFC?acao=editProd&idProduto=${p.idProduto}" class="btn btn-primary btn-sm">Alterar</a>
                            <a href="CadastroFC?acao=excProdExec&cod=${p.idProduto}" class="btn btn-danger btn-sm">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
