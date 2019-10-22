package com.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crud.domain.Produto;
import com.crud.service.ProdutoService;

@RestController
@RequestMapping("/api/produtos")
public class ProdutoController {

	private ProdutoService produtoService;
	
	@Autowired
	public ProdutoController(ProdutoService produtoService) {
		this.produtoService = produtoService;
	}
	
	@GetMapping()
	public ResponseEntity<List<Produto>> getAllProdutos(){
		return ResponseEntity.ok(produtoService.getAllProdutos());
	}
	
	@GetMapping("{id}")
	public ResponseEntity<Produto> getProdutoById(@PathVariable("id") Integer id){
		return produtoService.getProdutoById(id)
		           .map(record -> ResponseEntity.ok().body(record))
		           .orElse(ResponseEntity.notFound().build());
	}
	
	@PutMapping()
	public ResponseEntity<Produto> updateProduto(@RequestBody Produto produto) {
		return produtoService.getProdutoById(produto.getId())
		           .map(record -> {
		               record.setDescricao(produto.getDescricao());
		               record.setQtd(produto.getQtd());
		               record.setValor(produto.getValor());
		               Produto updated = produtoService.insertProduto(record);
		               return ResponseEntity.ok().body(updated);
		           }).orElse(ResponseEntity.notFound().build());
	}
	
	@PostMapping()
	public ResponseEntity<Produto> insertProduto(@RequestBody Produto produto){
		return ResponseEntity.ok(produtoService.insertProduto(produto));
	}
	
	@DeleteMapping()
	public ResponseEntity<?> deleteProduto(@PathVariable("id") Integer id) {
		return produtoService.getProdutoById(id)
        .map(record -> {
        	produtoService.deleteById(id);
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.notFound().build());
	}
	
}
