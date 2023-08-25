<!--#include file="ldap.asp" -->
<%
    On Error Resume Next

    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"

    Dim strUser, objSysInfo, objUser, strName, strTitle, strMail, strPhone, srtAddress, strUrlLogo, strTitleLogo, strUrlLogoGoverno, strUrlLogoGovernoBrasao, strUrlBarra, strUrlLinha, strUrlArvore, strUnidade, strUrlPandemia, strAcreditacao, strEleicao

    strUser = Request("usuario")
    strUnidade = Request("unidade")
    strEleicao = Request("eleicao")
    strUrlLogoGoverno = "logo_governo.png"
    strUrlLogoGovernoBrasao = "logo_governo_brasao.png"
    strUrlBarra = "barra.png"
    strUrlArvore = "arvore.png"
    strUrlPandemia = "pandemia.jpg"

    If lcase(strUnidade) = "hls" Then
        srtAddress = "Rua Iamacaru, 45 Jd Planalto - SP"
        strUrlLogo = "logo_hls.png"
        strTitleLogo = "HLS"
        strUnidade  = "Hospital Local de Sapopemba"
        strAcreditacao = "Qmentum International Diamond Accreditation"
        strPhone = "55 11 2024-7510"
    Else
        srtAddress = "Rua Manoel Franca dos Santos, 174 Jd Sapopemba - SP"
        strUrlLogo = "logo_hesap.png"
        strTitleLogo = "HESAP"
        strUnidade  = "Hospital Estadual de Sapopemba"
        strAcreditacao = "Qmentum International Diamond Accreditation"
        strPhone = "55 11 2014-6000"
    End If

    If strUser <> "" Then
        Set objuser = ObterObjUser(strUser)

        strName = objuser.FullName
        strTitle = objuser.Description
        strMail = objuser.Mail
        strPhone = objUser.TelephoneNumber
    Else
        strName = "Nome Sobrenome"
        strTitle = "Cargo"
        strMail = "nome.sobrenome@hesap.org.br"
    End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>HESAP - Assinatura de E-mail</title>
</head>
<body>
    <table cellpadding="0" cellspacing="0" border="0" style="font-size:12px; font-family: Arial; line-height: 17px;">
        <tbody>
            <tr>
                <td width="100%">
                    <table width="585" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td width="125" rowspan="6">
                                    <img src="./imagens_assinatura/<%=strUrlLogo%>" nosend="1" title="logo_hospital" alt="<%=strTitleLogo%>" width="110" height="70" border="0">
                                </td>

                                <% If strEleicao Then %>
                                <td width="100" rowspan="6">
                                    <img src="./imagens_assinatura/<%=strUrlLogoGovernoBrasao%>" nosend="1" title="logo_governo" alt="Governo do Estado de São Paulo" width="90" height="80" border="0">
                                </td>
                                <% Else %>
                                <td width="130" rowspan="6">
                                    <img src="./imagens_assinatura/<%=strUrlLogoGoverno%>" nosend="1" title="logo_governo" alt="Governo do Estado de São Paulo" width="115" height="70" border="0">
                                </td>
                                <% End If %>

                                <td width="333" style="font-size: 10.0pt; font-family: Verdana,sans-serif; color: black">
                                    <b><%=strName%></b>
                                </td>
                            </tr>
                            <tr>
                                <td width="333" style="font-size: 8.5pt; font-family: Verdana,sans-serif; color: black">
                                    <b><%=strTitle%></b>
                                </td>
                            </tr>
                            <tr>
                                <td width="333" style="font-size: 7.0pt; font-family: Verdana,sans-serif; color: black;"><%=strUnidade%></td>
                            </tr>
                            <tr>
                                <td width="333" style="font-size: 7.0pt; font-family: Verdana,sans-serif; color: black; border-bottom: 1px solid #001d51; "><b><%=strAcreditacao%></b></td>
                            </tr>
                            <tr>
                                <td width="333" style="font-size: 7.0pt; font-family: Verdana,sans-serif; color: black"><%=strMail%>&nbsp;|&nbsp;<%=strPhone%></td>
                            </tr>
                            <tr>
                                <td width="333" style="font-size: 7.0pt; font-family: Verdana,sans-serif; color: black">
                                    <%=srtAddress%>
                                </td>
                            </tr>
                            <tr>
                                <td width="580" colspan="3">
                                    <img src="./imagens_assinatura/<%=strUrlBarra%>" nosend="1" title="barra" alt="" width="580" height="7" border="0">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="./imagens_assinatura/<%=strUrlPandemia%>" nosend="1" title="pandemia" alt="A pandemia não acabou, o combate continua" width="350" height="100" border="0">
                </td>
            </tr>
            <tr>
                <td style="font-size: 9.0pt; font-family: Calibri,sans-serif; color: black">
                    AVISO LEGAL: As informações contidas nesta mensagem e seus anexos são
                    CONFIDENCIAIS e restritos aos remetentes e destinatários.
                </td>
            </tr>
            <!--<tr>
                <td style="font-size: 9.0pt; font-family: Calibri,sans-serif; color: green">
                    <b>Antes de imprimir pense na sua responsabilidade com o meio ambiente.</b>
                </td>
            </tr>
            <tr>
                <td style="font-size: 9.0pt; font-family: Calibri,sans-serif; color: black">
                    <img src="./imagens_assinatura/<%=strUrlArvore%>" nosend="1" title="arvore" alt="" width="70" height="50" border="0">
                </td>
            </tr>-->
        </tbody>
    </table>
</body>
</html>