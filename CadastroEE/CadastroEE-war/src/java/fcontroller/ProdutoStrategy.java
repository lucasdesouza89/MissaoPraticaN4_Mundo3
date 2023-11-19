package fcontroller;
import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/*

    Autor: Wallace Tavares

*/




public class ProdutoStrategy extends Strategy<ProdutoFacadeLocal> {

    public ProdutoStrategy(ProdutoFacadeLocal facade) {
        super(facade);
    }

    @Override
    public String executar(String acao, HttpServletRequest request) {
        String paginaDestino = "ListaProduto.jsp";

        switch (acao) {
            case "listaProd":
                List<Produto> listaProdutos = facade.findAll();
                request.setAttribute("lista", listaProdutos);
                break;

            case "excProdExec":
                int codigo = Integer.parseInt(request.getParameter("cod"));
                Produto produtoParaExcluir = facade.find(codigo);
                if (produtoParaExcluir != null) {
                    facade.remove(produtoParaExcluir);
                }
                listarProdutos(request);
                break;

            case "editProd":
                int idProdutoEdit = Integer.parseInt(request.getParameter("idProduto"));
                Produto produtoEdit = facade.find(idProdutoEdit);
                if (produtoEdit != null) {
                    request.setAttribute("produtoEdit", produtoEdit);
                }
                paginaDestino = "EditarProduto.jsp";
                break;

            case "editProdExec":
                int idProdutoEditExec = Integer.parseInt(request.getParameter("idProduto"));
                Produto produtoEditExec = facade.find(idProdutoEditExec);
                if (produtoEditExec != null) {
                    String nome = request.getParameter("nome");
                    int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                    float precoVenda = Float.parseFloat(request.getParameter("precoVenda"));
                    produtoEditExec.setNome(nome);
                    produtoEditExec.setQuantidade(quantidade);
                    produtoEditExec.setPrecoVenda(precoVenda);
                    facade.edit(produtoEditExec);
                }
                listarProdutos(request);
                break;

            case "incProdExec":
                String nomeInc = request.getParameter("nome");
                int quantidadeInc = Integer.parseInt(request.getParameter("quantidade"));
                float precoVendaInc = Float.parseFloat(request.getParameter("precoVenda"));
                List<Produto> listaProdutosInc = facade.findAll();
                int novoCodProdutoInc = 1;
                if (!listaProdutosInc.isEmpty()) {
                    int maxCodProduto = listaProdutosInc.stream()
                            .mapToInt(Produto::getIdProduto)
                            .max()
                            .getAsInt();
                    novoCodProdutoInc = maxCodProduto + 1;
                }

                Produto produtoInc = new Produto();
                produtoInc.setNome(nomeInc);
                produtoInc.setQuantidade(quantidadeInc);
                produtoInc.setIdProduto(novoCodProdutoInc);
                produtoInc.setPrecoVenda(precoVendaInc);
                facade.create(produtoInc);
                listarProdutos(request);
                break;

            case "incProd":
                paginaDestino = "DadosProduto.jsp";
                request.setAttribute("produto", new Produto());
                break;
        }

        return paginaDestino;
    }

    private void listarProdutos(HttpServletRequest request) {
        List<Produto> produtos = facade.findAll();
        request.setAttribute("lista", produtos);
    }
}
