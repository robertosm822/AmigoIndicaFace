function chkCPF(source, arguments) {

    var ok = true;

    var regExp = /^\d{3}\.\d{3}\.\d{3}\-\d{2}$/;

    if (!regExp.exec(arguments.Value))
        ok = false;

    var cpf = arguments.Value.replace(/\./g, "").replace(/\-/g, "");
    if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999") {
        ok = false;
    }

    add = 0;

    for (i = 0; i < 9; i++)
        add += parseInt(cpf.charAt(i)) * (10 - i);

    rev = 11 - (add % 11);

    if (rev == 10 || rev == 11)
        rev = 0;

    if (rev != parseInt(cpf.charAt(9))) {
        ok = false;
    }

    add = 0;

    for (i = 0; i < 10; i++)
        add += parseInt(cpf.charAt(i)) * (11 - i);

    rev = 11 - (add % 11);

    if (rev == 10 || rev == 11)
        rev = 0;

    if (rev != parseInt(cpf.charAt(10))) {
        ok = false;
    }
    
    arguments.IsValid = ok;
}

function mascaraData(c) {

    return false;

    if (c.value.length == 2) {
        c.value += '/';
    }
    else if (c.value.length == 5) {
        c.value += '/';
    }
}

function mascaraData2(c) {

    if (event.keyCode < 48 || event.keyCode > 57) {
        return false;
    }

    if (c.value.length == 2) {
        c.value += '/';
    }
    else if (c.value.length == 5) {
        c.value += '/';
    }

    return true;
}

function mascaraCPF(c) {
    if (c.value.length == 3) {
        c.value += '.';
    }
    else if (c.value.length == 7) {
        c.value += '.';
    }
    else if (c.value.length == 11) {
        c.value += '-';
    }
}

function mascaraTelefone(c) {
    if (c.value.length == 1) {
        c.value = '(' + c.value;
    }
    if (c.value.length == 3) {
        c.value += ') ';
    }
    else if (c.value.length == 9) {
        c.value += '-';
    }
}

function mascaraNumero() {
    if (event.keyCode < 48 || event.keyCode > 57) {
        return false;
    }
} 

function Clean(obj, type) {
    if (obj.value == type) {
        obj.value = '';
    }
}

function Fill(obj, type) {
    if (obj.value == '') {
        obj.value = type;
    }
}

function selectAllCheckBoxes(id, total, selectAll) {
    var strTotal = document.getElementById(total).innerHTML;
    if (selectAll.checked) {
        for (contCheckBox = 0; contCheckBox < strTotal; contCheckBox++) {
            document.getElementById(id + contCheckBox).checked = true;
        }
    }
    else {
        for (contCheckBox = 0; contCheckBox < strTotal; contCheckBox++) {
            document.getElementById(id + contCheckBox).checked = false;
        }
    }
}

function ShowButton(name) {
    if (document.getElementById(name).style.display == "none")
        document.getElementById(name).style.display = "block";
    else
        document.getElementById(name).style.display = "none";
}

/*Função Pai de Mascaras*/
function Mascara(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("execmascara()", 1)
}

/*Função que Executa os objetos*/
function execmascara() {
    v_obj.value = v_fun(v_obj.value)
}

/*Função que Determina as expressões regulares dos objetos*/
function leech(v) {
    v = v.replace(/o/gi, "0")
    v = v.replace(/i/gi, "1")
    v = v.replace(/z/gi, "2")
    v = v.replace(/e/gi, "3")
    v = v.replace(/a/gi, "4")
    v = v.replace(/s/gi, "5")
    v = v.replace(/t/gi, "7")
    return v
}
/*Função que padroniza telefone (11) 41841241*/
function Telefone(v) {
    v = v.replace(/\D/g, "")
    v = v.replace(/^(\d\d)(\d)/g, "($1) $2")
    v = v.replace(/(\d{4})(\d)/, "$1-$2")
    return v
}
/*Função que padroniza CPF*/
function Cpf(v) {
    v = v.replace(/\D/g, "")
    v = v.replace(/(\d{3})(\d)/, "$1.$2")
    v = v.replace(/(\d{3})(\d)/, "$1.$2")
    v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
    return v
}

function teste() {
    alert("testando!");
}

function FormataCpf(campo, teclapres) {
    var tecla = teclapres.keyCode;
    var vr = new String(campo.value);
    vr = vr.replace(".", "");
    vr = vr.replace("/", "");
    vr = vr.replace("-", "");
    tam = vr.length + 1;
    if (tecla != 14) {
        if (tam == 4)
            campo.value = vr.substr(0, 3) + '.';
        if (tam == 7)
            campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 6) + '.';
        if (tam == 11)
            campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(7, 3) + '-' + vr.substr(11, 2);
    }
}

function FormataCpf2(campo, teclapres, e) {
    var tecla = teclapres.keyCode;

    if (e.keyCode == 8) {
        return;
    }

    var vr = new String(campo.value);
    vr = vr.replace(".", "");
    vr = vr.replace("/", "");
    vr = vr.replace("-", "");
    tam = vr.length + 1;
    if (tecla != 14) {
        if (tam == 4)
            campo.value = vr.substr(0, 3) + '.';
        if (tam == 7)
            campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 6) + '.';
        if (tam == 11)
            campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(7, 3) + '-' + vr.substr(11, 2);
    }
}

function verificaCopiaNumero(textBox, e) {

    var texto = window.clipboardData.getData("Text");
    var charTexto;
    var charCode;

    for (i = 0; i <= texto.length - 1; i++) {
        charTexto = texto.charAt(i);
        charCode = charTexto.charCodeAt(0);
        if (charCode < 48 || charCode > 57) {
            return false;
        }
    }

    return true;

}

function verificaCopiaData(textBox, e) {

    var texto = window.clipboardData.getData("Text");
    var charTexto;
    var charCode;

    for (i = 0; i <= texto.length - 1; i++) {
        charTexto = texto.charAt(i);
        charCode = charTexto.charCodeAt(0);
        if (i == 2 || i == 5) {
            if (charTexto != '/') {
                return false;
            }
        } else {
            if (charCode < 48 || charCode > 57) {
                return false;
            }
        }
    }

    return true;

}

