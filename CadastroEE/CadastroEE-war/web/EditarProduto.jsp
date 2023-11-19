<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Produto</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
</head>
<body>
    <form action="CadastroFC" method="post">
        <input type="hidden" name="acao" value="editProdExec"/>
        <input type="hidden" name="idProduto" value="${produtoEdit.idProduto}"/>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome do Produto:</label>
                        <input type="text" name="nome" id="nome" class="form-control" value="${produtoEdit.nome}" required/>
                    </div>
                    <div class="mb-3">
                        <label for="quantidade" class="form-label">Quantidade:</label>
                        <input type="number" name="quantidade" id="quantidade" class="form-control" value="${produtoEdit.quantidade}" required/>
                    </div>
                    <div class="mb-3">
                        <label for="precoVenda" class="form-label">Preço de Venda:</label>
                        <input type="number" step="0.01" name="precoVenda" id="precoVenda" class="form-control" value="${produtoEdit.precoVenda}" required/>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <input type="submit" value="Salvar" class="btn btn-primary"/>
                <a href="CadastroFC?acao=listaProd" class="btn btn-secondary">Cancelar</a>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
