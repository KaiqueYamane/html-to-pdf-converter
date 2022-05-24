<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <meta charset="UTF-8">
        <title>Braspag :: Tecnologia em Pagamentos</title>
        <link href="https://transactionsandbox.pagador.com.br/post/Content/boleto.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        
        <!-- <#setting locale="pt_BR"> -->
        <div id="container">
            
            <p style="margin-top: 0; font-size: 8pt">
                <strong>Instruções:</strong><br />
                <i>
                    1 - Imprima em impressora jato de tinta (ink jet) ou a laser em qualidade normal
                    ou alta. Não use modo econômico.<br />
                    2 - Utilize folha A4 (210x297mm) ou carta (216x279mm) e margens mínimas a esquerda
                    e a direita do formulário<br />
                    3 - Corte na linha indicada. Não rasure, risque, fure ou dobre a região onde se
                    encontra o código de barras.<br />
                </i>
            </p>
            <div class="container">
                <div>
                    <img src="https://transactionsandbox.pagador.com.br/post/images/boleto/corte.gif" alt="image" class="border0Width640" />
                </div>
                <br />
                <table class="noborder border0Width640">
                    <tr>
                        <td class="noborder alignCenterValignTop" colspan="2">
                            <strong>
                                <span class="campo" style="font-size: 10pt">Recibo do Pagador</span>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder" style="width:150px;">
                            <img id="upperBankImage" src="https://transactionsandbox.pagador.com.br/post/images/boleto/000.jpg" style="border:0;" alt="" class="bankImage">
                        </td>
                        <td class="noborder" style="vertical-align:bottom;">
                            <table class="noborder" style="height:25px;width:480px;float:right;">
                                <tr>
                                    <td class="noborder" style="border-left: #000000 2px solid;text-align:center;width:60px;">
                                        <span id="lowerBankCode" class="campo bankCode" style="font-size:10pt">
                                            000-0
                                        </span>
                                    </td>
                                    <td class="noborder" style="border-left: #000000 2px solid;text-align:right;">
                                        <span id="lowerLineIdentity" class="campo lineIdentity">
                                            ${object.linhaDigitavel}
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table style="width:640px;">
                    <tr>
                        <td style="height:27px;width:340px;vertical-align:top;" colspan="3">
                            Beneficiário:<br />
                            <span class="campo">
                                ALELO S/A
                            </span><br />
                            <span>
                                CNPJ/CPF: 04.740.876/0001-25
                            </span>
                            <br />
                        </td>
                        <td style="vertical-align:top;width:150px;">
                            Agência/Código Beneficiário<br />
                            <div style="text-align:right;" class="campo">
                                9999/9999999
                            </div>
                        </td>
                        <td style="background-color:#dddddd;vertical-align:top;width:150px;">
                            Vencimento<br />
                            <div style="text-align:right;" class="campo">
                                ${object.dataVencimento}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:27px;vertical-align:top;" colspan="3">
                            Pagador 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            CNPJ/CPF:${object.documento}<br />
                            <span class="campo">
                                ${(object.nome)!}
                            </span>
                        </td>
                        <td style="vertical-align:top;">
                            Número do Documento<br />
                            <div style="text-align:right;" class="campo">
                                01
                            </div>
                        </td>
                        <td style="vertical-align:top;">
                            Nosso Número<br />
                            <div style="text-align:right;" class="campo">
                                2-3
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:27px;vertical-align:top;background-color:#dddddd;width:90px;">
                            Espécie<br />
                            <div style="text-align:center;" class="campo">
                                R$
                            </div>
                        </td>
                        <td style="vertical-align:top;width:100px;">
                            Quantidade
                            <br />
                        </td>
                        <td id="content" style="vertical-align:top;width:150px;">
                            (x) Valor
                            <br />
                        </td>
                        <td style="vertical-align:top;">
                            (-) Descontos / Abatimentos<br />
                            &nbsp;
                        </td>
                        <td style="vertical-align:top;background-color:#dddddd;">
                            (=) Valor Documento
                            <br />
                            <div style="text-align:right;" class="campo">
                                ${object.valor}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:27px;vertical-align:bottom;" colspan="3">
                            Demonstrativo:
                        </td>
                        <td style="vertical-align:top;">
                            (+) Outros Acréscimos
                            <br />
                            &nbsp;
                        </td>
                        <td style="vertical-align:top;">
                            (=) Valor Cobrado<br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height:70px;vertical-align:top;" colspan="5">
                            <span class="campo">
                                ${object.demonstrativo}
                            </span>
                        </td>
                    </tr>
                </table>
                <br />
                <div>
                    <img src="https://transactionsandbox.pagador.com.br/post/images/boleto/corte.gif" style="border:0;width:640px;" alt="image" />
                </div>
                <br />
                <table class="noborder" style="width:640px">
                    <tr>
                        <td class="noborder" colspan="2" style="text-align:center;vertical-align:top;">
                            <strong>
                                <span class="campo" style="font-size: 10pt">Ficha de Compensação</span>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder" style="width:150px;">
                            <img id="upperBankImage" src="https://transactionsandbox.pagador.com.br/post/images/boleto/000.jpg" style="border:0;" alt="" class="bankImage">
                        </td>
                        <td class="noborder" style="vertical-align:bottom;">
                            <table class="noborder" style="height:25px;width:480px;float:right;">
                                <tr>
                                    <td class="noborder" style="border-left: #000000 2px solid;text-align:center;width:60px;">
                                        <span id="lowerBankCode" class="campo bankCode" style="font-size:10pt">
                                            000-0
                                        </span>
                                    </td>
                                    <td class="noborder" style="border-left: #000000 2px solid;text-align:right;">
                                        <span id="lowerLineIdentity" class="campo lineIdentity">
                                            ${object.linhaDigitavel}
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table style="width:640px;">
                    <tr>
                        <td style="height:27px;width:490px;" colspan="6">
                            Local de Pagamento
                            <br />
                            <span class="campo">
                                Até o vencimento pagável em bancos do sistema de compensação.
                            </span>
                        </td>
                        <td style="background-color:#dddddd;vertical-align:top;width:150px;">
                            Vencimento
                            <br />
                            <div style="text-align:right;" class="campo">
                                ${object.dataVencimento}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;height:27px;width:490px;" colspan="6">
                            Beneficiário <br />
                            <span class="campo">
                                ALELO S/A
                            </span><br />
                            <span>
                                CNPJ/CPF: 04.740.876/0001-25
                            </span>
                            <br />
                        </td>
                        <td style="vertical-align:top;">
                            Agência/Código Beneficiário<br />
                            <div style="text-align:right;" class="campo">
                                9999/9999999
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;height:27px;">
                            Data Documento<br />
                            <div style="text-align:center;" class="campo">
                                30/04/2022
                            </div>
                        </td>
                        <td style="vertical-align:top;" colspan="2">
                            Número do Documento<br />
                            <div style="text-align:center;" class="campo">
                                01
                            </div>
                        </td>
                        <td style="vertical-align:top;">
                            Espécie Doc.<br />
                            <div style="text-align:center;" class="campo">
                                RC
                            </div>
                        </td>
                        <td style="vertical-align:top;">
                            Aceite<br />
                            <div style="text-align:center;" class="campo">
                                N
                            </div>
                        </td>
                        <td style="vertical-align:top;">
                            Data Processamento<br />
                            <div style="text-align:center;" class="campo">
                                19/5/2022
                            </div>
                        </td>
                        <td style="vertical-align:top;">
                            Nosso Número<br />
                            <div style="text-align:right;" class="campo">
                                2-3
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:27px;vertical-align:top;">
                            Uso do Banco<br />
                            <div style="text-align:center;" class="campo">
                            </div>
                        </td>
                        <td style="vertical-align:top;">
                            Carteira<br />
                            <div style="text-align:center;" class="campo">
                                25
                            </div>
                        </td>
                        <td style="vertical-align:top;background-color:#dddddd;">
                            Espécie<br />
                            <div style="text-align:center;" class="campo">
                                R$
                            </div>
                        </td>
                        <td style="vertical-align:top;" colspan="2">
                            Quantidade<br />
                        </td>
                        <td style="vertical-align:top;">
                            (x) Valor<br />
                        </td>
                        <td style="vertical-align:top;background-color:#dddddd;">
                            (=) Valor documento
                            <br />
                            <div style="text-align:right;" class="campo">
                                ${object.valor}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top" colspan="6" rowspan="5">
                            <b>Instruções (Texto de Responsabilidade do Beneficiário)</b>
                            <br />
                            <div style="text-align: left">
                                <span class="campo">${object.instrucoes}</span>
                            </div>
                        </td>
                        <td style="vertical-align:top;height:27px;">
                            (-) Descontos / Abatimentos
                            <br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;height:27px;">
                            (-) Outras Deduções
                            <br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;height:27px;">
                            (+) Mora / Multa
                            <br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;height:27px;">
                            (+) Outros Acrescimos
                            <br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top;height:27px;">
                            (=) Valor
                            <br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height:70px;vertical-align:top;" colspan="7">
                            Pagador: 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            CNPJ/CPF:${object.documento}
                            <br />
                            <span class="campo">
                                ${(object.nome)!}
                            </span>
                            <br />
                            <span class="campo">
                                ${object.endereco}&nbsp;${object.numero}&nbsp;
                            </span>
                            <br />
                            <span class="campo">
                                ${object.bairro}&nbsp;${object.cidade}&nbsp;${object.estado}&nbsp;
                            </span>
                            <br />
                            <span class="campo">
                                ${object.cep}
                            </span>
                        </td>
                    </tr>
                </table>
                <table class="noborder" style="width:640px;">
                    <tr>
                        <td class="noborder" style="height:10px;"></td>
                    </tr>
                    <tr>
                        <td class="noborder" style="height:10px;text-align:right;">
                            <strong>Autenticação Mecânica/Ficha de Compensação</strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="noborder">
                                ${barcodesvg}
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>