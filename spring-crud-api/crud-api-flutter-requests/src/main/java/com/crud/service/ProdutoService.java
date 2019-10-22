package com.crud.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crud.domain.Produto;
import com.crud.repository.ProdutoRepository;

@Service
public class ProdutoService {

	private ProdutoRepository repository;
	
	@Autowired
	public ProdutoService(ProdutoRepository repository) {
		this.repository = repository;
	}
	
	public List<Produto> getAllProdutos() {
		return repository.findAll();
	}
	
	public Optional<Produto> getProdutoById(Integer id) {
		return repository.findById(id);
	}
	
	public Produto updateProduto(Produto produto) {
		return repository.saveAndFlush(produto);
	}
	
	public Produto insertProduto(Produto produto) {
		return repository.save(produto);
	}
	
	public void deleteById(Integer id) {
		repository.deleteById(id);;
	}
	
}
