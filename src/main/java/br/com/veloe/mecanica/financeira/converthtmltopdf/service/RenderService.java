package br.com.veloe.mecanica.financeira.converthtmltopdf.service;

import br.com.veloe.mecanica.financeira.converthtmltopdf.dto.RenderPDFDTO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code128Writer;
import freemarker.template.TemplateException;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.formatter.SVGFormatter;
import net.sourceforge.barbecue.output.SVGOutput;
import org.jfree.graphics2d.svg.SVGGraphics2D;
import org.jfree.graphics2d.svg.ViewBox;
import org.jsoup.Jsoup;
import org.springframework.stereotype.Service;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;

import javax.imageio.ImageIO;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;

import org.jdom.Content;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.EmptyBorder;
import javax.xml.bind.DatatypeConverter;

@Slf4j
@Service
@AllArgsConstructor
public class RenderService {

    private final ConverterService converterService;

    public void renderPDF(RenderPDFDTO dto) throws Exception {

        log.info("RenderService.renderPDF :: INICIO . dto: " + dto);
        File file = new File("temp/output.html");

        fillHTMLFileWithFreeMaker(file, dto);
        converterService.convertOpenHTML(Jsoup.parse(file, "UTF-8"));
    }

    private void fillHTMLFileWithFreeMaker(File file, RenderPDFDTO dto) throws IOException, TemplateException, Exception {

        Writer fileWriter = new FileWriter(file);

        try {
            Configuration cfg = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
            cfg.setDefaultEncoding("UTF-8");
            cfg.setLocale(new Locale("pt", "BR"));
            cfg.setIncompatibleImprovements(new Version(2, 3, 20));
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

            Map<String, Object> input = new java.util.HashMap<>(Collections.singletonMap("object", dto));
            input.put("barcodesvg", getBarCodeSvg(dto.getCodigoBarras()));
            Template template = cfg.getTemplate("boleto-template.ftl");
            template.process(input, fileWriter);
        } finally {
            fileWriter.close();
        }
    }

    public static File generateCode128BarcodeImage(String barcodeText) throws Exception {

        log.info("RenderService.renderPDF :: INICIO > barcode: " + barcodeText);

        Code128Writer writer = new Code128Writer();
        File file = new File("temp/barcode.jpg");
        BitMatrix matrix = writer.encode(barcodeText, BarcodeFormat.CODE_128, 640, 54);
        MatrixToImageWriter.writeToPath(matrix, "jpg", Paths.get(file.getPath()));

        return file;
    }

    public static String getBarCodeSvg(String barCodeText) throws Exception {

        log.info("RenderService.getBarCodeSvg :: INICIO > barcode: " + barCodeText);

        StringWriter stringWriter = new StringWriter();
        Barcode code128 = BarcodeFactory.createCode128(barCodeText);
        code128.setDrawingText(false);
        code128.setDrawingQuietSection(false);
        code128.output(new SVGOutput(stringWriter, code128.getFont(), code128.getForeground(), code128.getBackground(), 0.0078125, "in"));

        String svgString = stringWriter.toString().replaceAll("svg:", "");
        svgString = "<svg" + svgString.split("<svg", 2)[1];

        log.info("RenderService.getBarCodeSvg :: SVG Criado: " + svgString);

        return svgString;
    }
}
