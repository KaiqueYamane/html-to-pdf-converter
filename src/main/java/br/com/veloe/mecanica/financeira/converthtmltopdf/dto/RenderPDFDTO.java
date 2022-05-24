package br.com.veloe.mecanica.financeira.converthtmltopdf.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class RenderPDFDTO {

    private String codigoBarras;
    private String linhaDigitavel;
    private LocalDate dataVencimento;
    private BigDecimal valor;
    private String instrucoes;
    private String demonstrativo;
    private String documento;
    private String nome;
    private String endereco;
    private String numero;
    private String bairro;
    private String cidade;
    private String estado;
    private String cep;
//    private String imagePath;
}