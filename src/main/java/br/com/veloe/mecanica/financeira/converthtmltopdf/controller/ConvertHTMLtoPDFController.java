package br.com.veloe.mecanica.financeira.converthtmltopdf.controller;

import br.com.veloe.mecanica.financeira.converthtmltopdf.service.ConverterService;
import lombok.AllArgsConstructor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@AllArgsConstructor
@RequestMapping("/convert")
public class ConvertHTMLtoPDFController {

    private final ConverterService service;

    @GetMapping
    private void convert () {

        StopWatch watch = new StopWatch();
        watch.start();

        service.convertHTMLtoPDF();

        watch.stop();
        System.out.println("Tempo de execução: " + watch.getTotalTimeMillis() + "ms.");
    }

    @GetMapping("/open-html")
    private void convertOpenHTML () throws IOException {

        StopWatch watch = new StopWatch();
        watch.start();

        Document document = Jsoup.connect("https://transactionsandbox.pagador.com.br/post/Boleto/Issue/249e9226-6e7e-4007-9ccd-f8ce2f9c04f5").get();
        service.convertOpenHTML(document);

        watch.stop();
        System.out.println("Tempo de execução: " + watch.getTotalTimeMillis() + "ms.");
    }
}
