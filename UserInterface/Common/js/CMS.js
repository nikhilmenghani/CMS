
$('#para').click(function () {
    $('#para').hide();
});
$(document).ready(function () {
    $("#tabs").tabs();
    document.getElementById('edit_profile_content').style.display = 'block';
});

function display1From2Div(divOnValTrue, divOnValFalse) {
        document.getElementById(divOnValTrue).style.display = 'block';
        document.getElementById(divOnValFalse).style.display = 'none';
}

function display1From3Div(divOnValTrue, div1OnValFalse, div2OnValFalse) {
    document.getElementById(divOnValTrue).style.display = 'block';
    document.getElementById(div1OnValFalse).style.display = 'none';
    document.getElementById(div2OnValFalse).style.display = 'none';
}

function displayDivFrom2DDLValues(divID, val, divOnValTrue, divOnValFalse) {
    if (divID.options[divID.selectedIndex].text == val) {
        display1From2Div(divOnValTrue, divOnValFalse);
    }
    else {
        display1From2Div(divOnValFalse, divOnValTrue);
    }
}

function displayDivFrom3DDLValues(divID, val1, val2, divOnValTrue, div1OnValFalse, div2OnValFalse) {
    if (divID.options[divID.selectedIndex].text == val1) {
        display1From3Div(divOnValTrue, div1OnValFalse, div2OnValFalse);
    }
    else if (divID.options[divID.selectedIndex].text == val2) {
        display1From3Div(div1OnValFalse, div2OnValFalse, divOnValTrue);
    } else {
        display1From3Div(div2OnValFalse, divOnValTrue, div1OnValFalse);
    }
}

function CopyValue(divID1, divID2) {
    document.getElementById(divID2).value = document.getElementById(divID1).options[document.getElementById(divID1).selectedIndex].text;
}

function PopulateDivision(DivID, DeptID, csFunction, pageUrl) {
    var div = $('#' + DivID);
    var dept = $('#' + DeptID);
    div.attr("disabled", "disabled");
    if (dept.val() == "0") {
        div.empty().append('<option selected="selected" value="0">Select Division</option>');
    }
    else {
        div.empty().append('<option selected="selected" value="0">Loading...</option>');
        var dept = '{deptID:"' + $('#' + DeptID + ' option:selected').html() + '"}';
        $.ajax({
            type: "POST",
            url: pageUrl + '/' + csFunction + '',
            data: dept,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.length > 0) {
                    div.removeAttr("disabled");
                    div.empty().append('<option selected="selected" value="0">Select Division</option>');
                    $.each(response.d, function () {
                        if (this['Text'] == "1") {
                            div.append($("<option></option>").val("1").html("A"));
                            div.append($("<option></option>").val("2").html("B"));
                        }
                        else {
                            div.append($("<option></option>").val("1").html("A"));
                        }
                    });
                }
                else {
                    div.empty().append('<option selected="selected" value="0">Not available<option>');
                }
            },
            failure: function (response) {
                alert("Failed");
                alert(response.d);
            }
        });
    }
}

function PopulateChildDDLUsingOneParentDDL(childDDL, parentDDL, csFunction, pageUrl) {
    var child = $('#' + childDDL);
    var parent = $('#' + parentDDL);
    child.attr("disabled", "disabled");
    if (parent.val() == "0") {
        child.empty().append('<option selected="selected" value="0">Select Staff</option>');
    }
    else {
        child.empty().append('<option selected="selected" value="0">Loading...</option>');
        var parent = '{deptID:"' + $('#' + parentDDL + ' option:selected').html() + '"}';
        
        $.ajax({
            type: "POST",
            url: pageUrl + '/' + csFunction + '',
            data: parent,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.length > 0) {
                    child.removeAttr("disabled");
                    child.empty().append('<option selected="selected" value="0">Select Staff</option>');
                    $.each(response.d, function () {
                        child.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
                else {
                    child.empty().append('<option selected="selected" value="0">Not available<option>');
                }
            },
            failure: function (response) {
                alert("Failed");
                alert(response.d);
            }
        });
    }
}

function PopulateChildDDLUsingTwoParentDDL(childDDL, parent1DDL, parent2DDL, csFunction, pageUrl) {
    var parent1 = $('#' + parent1DDL);
    var parent2 = $('#' + parent2DDL);
    var child = $('#' + childDDL);
    child.attr("disabled", "disabled");
    if (parent2.val() == "0" || parent1.val() == "0") {
        child.empty().append('<option selected="selected" value="0">Select Subject</option>');
    }
    else {
        child.empty().append('<option selected="selected" value="0">Loading...</option>');
        var parent_data = '{semID:"' + parent1.val() + '", deptID:"' + $('#' + parent2DDL + ' option:selected').html() + '"}';
        $.ajax({
            type: "POST",
            url: pageUrl + '/' + csFunction + '',
            data: parent_data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.length > 0) {
                    child.removeAttr("disabled");
                    child.empty().append('<option selected="selected" value="0">Select Subject</option>');
                    $.each(response.d, function () {
                        child.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
                else {
                    child.empty().append('<option selected="selected" value="0">Not available<option>');
                }
            },
            failure: function (response) {
                alert("Failed");
                alert(response.d);
            }
        });
    }
}

function PopulateChildDDLUsingThreeParentDDL(childDDL, parent1DDL, parent2DDL, parent3DDL, csFunction, pageUrl) {
    var parent1 = $('#' + parent1DDL);
    var parent2 = $('#' + parent2DDL);
    var parent3 = $('#' + parent3DDL);
    var child = $('#' + childDDL);
    child.attr("disabled", "disabled");
    if (parent2.val() == "0" || parent1.val() == "0") {
        child.empty().append('<option selected="selected" value="0">Select Subject</option>');
    }
    else {
        child.empty().append('<option selected="selected" value="0">Loading...</option>');
        var parent_data = '{semID:"' + parent1.val() + '", deptID:"' + $('#' + parent2DDL + ' option:selected').html() + '", divID:"' + $('#' + parent3DDL + ' option:selected').html() + '"}';
        $.ajax({
            type: "POST",
            url: pageUrl + '/' + csFunction + '',
            data: parent_data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d.length > 0) {
                    child.removeAttr("disabled");
                    child.empty().append('<option selected="selected" value="0">Select Subject</option>');
                    $.each(response.d, function () {
                        child.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
                else {
                    child.empty().append('<option selected="selected" value="0">Not available<option>');
                }
            },
            failure: function (response) {
                alert("Failed");
                alert(response.d);
            }
        });
    }
}
