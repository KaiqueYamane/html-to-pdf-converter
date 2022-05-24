package br.com.veloe.mecanica.financeira.converthtmltopdf.controller;

import br.com.veloe.mecanica.financeira.converthtmltopdf.dto.RenderPDFDTO;
import br.com.veloe.mecanica.financeira.converthtmltopdf.service.RenderService;
import freemarker.template.TemplateException;
import lombok.AllArgsConstructor;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@AllArgsConstructor
@RequestMapping("/render")
public class RenderPDFController {

    private final RenderService service;
    private final StopWatch watch = new StopWatch();

    @GetMapping(value = "/code128/{barcode}", produces = MediaType.IMAGE_PNG_VALUE)
    public byte[] barbecueEAN13Barcode(@PathVariable("barcode") String barcode) throws Exception {
        File file = RenderService.generateCode128BarcodeImage(barcode);
        return Files.readAllBytes(file.toPath());
    }

    @GetMapping(value = "/svg/{barcode}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity<?> svgBarcode(@PathVariable("barcode") String barcode) throws Exception {
        String svg = RenderService.getBarCodeSvg(barcode);
        return ResponseEntity.ok(svg);
    }

    @PostMapping(value = "/pdf")
    private ResponseEntity<?> renderPDF (@RequestBody RenderPDFDTO dto) {
        watch.start();

        try {
            service.renderPDF(dto);

            watch.stop();
            System.out.println("Tempo de execução: " + watch.getTotalTimeMillis() + "ms.");

            return ResponseEntity.ok().body("OK");

        } catch (Exception e) {
            watch.stop();
            System.out.println("Tempo de execução: " + watch.getTotalTimeMillis() + "ms.");
            throw new RuntimeException("Erro ao renderizar Boleto", e);
        }
    }
}
