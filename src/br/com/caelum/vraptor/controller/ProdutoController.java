package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.ProdutoDao;
import br.com.caelum.vraptor.model.Produto;
import br.com.caelum.vraptor.simplemail.Mailer;
import br.com.caelum.vraptor.validator.Validator;

@Controller
public class ProdutoController {

	private final Result result;

	private final ProdutoDao dao;
	private final Validator validator;
	private final Mailer mailer;

	@Inject
	public ProdutoController(Result result, ProdutoDao dao, Validator validator, Mailer mailer) {
		this.result = result;
		this.dao = dao;
		this.validator = validator;
		this.mailer = mailer;
	}

	public ProdutoController() {
		this(null, null, null, null);
	}

	@Get("/")
	public void inicio() {

	}

	public void lista() {

		result.include("produtoList", dao.lista());
	}

	@Get
	public void sobre() {

	}

	@Get
	public void formulario() {

	}

	@Post
	public void adiciona(@Valid Produto produto) {

		validator.onErrorUsePageOf(this).formulario();
		dao.adiciona(produto);
		result.include("mensagem", "Produto adicionado com sucesso");

		result.redirectTo(this).lista();

	}

	@Get
	public void remove(Produto produto) {

		dao.remove(produto);
	}

	@Get
	public void enviaPedidoDeNovosItens(Produto produto) throws EmailException {

		Email email = new SimpleEmail();
		email.setSubject("Precisamos de mais estoque");
		email.setMsg("O produto " + produto.getNome() + " está em falta no estoque");
		email.addTo("gustavogmfarias@gmail.com");
		mailer.send(email);
		result.redirectTo(this).lista();

	}
}