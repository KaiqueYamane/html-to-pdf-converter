package br.com.veloe.mecanica.financeira.converthtmltopdf.service;

import br.com.veloe.mecanica.financeira.converthtmltopdf.utils.B64ImgReplacedElementFactory;
import br.com.veloe.mecanica.financeira.converthtmltopdf.utils.CustomUserAgent;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Entities;
import org.springframework.stereotype.Service;
import org.xhtmlrenderer.layout.SharedContext;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.jsoup.nodes.Document;

@Slf4j
@Service
public class ConverterService {

    public void convertHTMLtoPDF() {
        log.info("ConverterService.convertHTMLtoPDF :: INICIO");

        try {

            // HTML file - Input
            File inputHTML = new File("boleto.html");
            URL url = new URL("https://transactionsandbox.pagador.com.br/post/Boleto/Issue/249e9226-6e7e-4007-9ccd-f8ce2f9c04f5");
//            FileUtils.copyURLToFile(url, inputHTML);

            // Converted PDF file - Output
            File outputPdf = new File("boleto-teste.pdf");

            //create well formed HTML
            String xhtml = createWellFormedHtml(inputHTML);
            System.out.println("Starting conversion to PDF...");
            xhtmlToPdf(xhtml, outputPdf);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        log.info("ConverterService.convertHTMLtoPDF :: FIM");
    }

    private void xhtmlToPdf(String xhtml, File outputPdf) throws IOException {

        OutputStream outputStream = null;
        try {
            ITextRenderer renderer = new ITextRenderer();
            SharedContext sharedContext = renderer.getSharedContext();
            sharedContext.setPrint(true);
            sharedContext.setInteractive(false);

            // Register custom ReplacedElementFactory implementation
//            sharedContext.setReplacedElementFactory(new ReplacedElementFactoryImpl());
//            sharedContext.getTextRenderer().setSmoothingThreshold(0);

            // Register additional font
            String baseUrl = "https://transactionsandbox.pagador.com.br/post/Content/boleto.css";
            renderer.setDocumentFromString(xhtml, baseUrl);

            renderer.layout();
            outputStream = new FileOutputStream(outputPdf);
            renderer.createPDF(outputStream);
            System.out.println("PDF creation completed");
        } finally {
            if (outputStream != null)
                outputStream.close();
        }
    }

    private String createWellFormedHtml(File inputHTML) throws IOException {
        Document document = Jsoup.parse(inputHTML, "UTF-8");
        document.outputSettings().escapeMode(Entities.EscapeMode.xhtml).syntax(Document.OutputSettings.Syntax.xml);
        System.out.println("HTML parsing done...");
        return document.html();
    }

    public void convertOpenHTML(Document document) {

        log.info("ConverterService.convertOpenHTML :: INICIO");

        try {

            ITextRenderer renderer = new ITextRenderer();
            OutputStream outputStream = new FileOutputStream("temp/boleto-renderizado.pdf");

            document.outputSettings().escapeMode(Entities.EscapeMode.xhtml).syntax(Document.OutputSettings.Syntax.xml);
            document.charset(StandardCharsets.UTF_8);

            renderer.setDocumentFromString(document.html());
            renderer.getSharedContext().setPrint(true);
            renderer.getSharedContext().setInteractive(false);
            renderer.getSharedContext().getTextRenderer().setSmoothingThreshold(0);

            renderer.getSharedContext().setReplacedElementFactory(new B64ImgReplacedElementFactory());

            renderer.layout();
            renderer.createPDF(outputStream);
            renderer.finishPDF();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        log.info("ConverterService.convertOpenHTML :: FIM");
    }
}
