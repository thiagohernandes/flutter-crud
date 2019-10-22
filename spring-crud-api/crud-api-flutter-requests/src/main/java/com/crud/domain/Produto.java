package com.crud.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Data;
import lombok.NoArgsConstructor;

@JsonInclude(Include.ALWAYS)
@Entity
@Table(name="tbl_produtos")
@Data
@NoArgsConstructor
public class Produto {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	@Column(name="descricao")
	private String descricao;
	@Column(name="qtd")
	private int qtd;
	@Column(name="valor")
	private Double valor;

}
