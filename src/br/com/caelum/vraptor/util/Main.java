package br.com.caelum.vraptor.util;

import br.com.caelum.vraptor.model.Produto;

public class Main {
	
	public static void main(String[] args) throws CloneNotSupportedException {
		
		Produto produto = new Produto();
		produto.setId(1L);
		produto.setNome("arroz");
		
		
		Produto produto2 = (Produto) produto.clone();
		produto2.setNome("feijao");
		
		
		System.out.println(produto.getNome());
		System.out.println(produto2.getNome()); 
		System.out.println(produto.getId());
		System.out.println(produto2.getId()); 
		
	}
	
	

}
