<%@ page import="common.util.*" %>
<%@ include file="/login_check.jsp" %>
<%@ include file="/common/calendar/calendar.htm" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server

String today = DateUtil.getToday("dd/MM/yyyy");
String optionHh = "<option value=''></option>";
String optionMi = "<option value=''></option>";

// set HH, MI options
for (int i = 0; i < 24; i++) {
  optionHh += "<option value='" + (i < 10 ? "0" : "") + i + "'>" + (i < 10 ? "0" : "") + i + "</option>";
}

for (int i = 0; i < 60; i++) {
  optionMi += "<option value='" + (i < 10 ? "0" : "") + i + "'>" + (i < 10 ? "0" : "") + i + "</option>";
}
%>
<HTML>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javaScript" src="/common/js/util.js"></script>
<SCRIPT LANGUAGE="JavaScript">
var flagObj = null;     // to avoid cross call onblur event handler

function fnCheckBayTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var topQty = 0;
  var middleQty = 0;
  var bottomQty = 0;
  var tmpTotal = 0;
  var bayTotal = 0;
  var objName = obj.name;                 // name format : s1_bay1_total
  var sectionName = objName.substring(0, objName.indexOf("_"));
  var bayName = objName.substring(objName.indexOf("_")+1, objName.lastIndexOf("_"));

  // if values are not input, do not check
  if (!eval("document.form1." + sectionName + "_top_" + bayName).value
      && !eval("document.form1." + sectionName + "_middle_" + bayName).value
      && !eval("document.form1." + sectionName + "_bottom_" + bayName).value
      && !obj.value) {
    return;
  }

  if (obj.value) {
    bayTotal = parseFloat(obj.value);
  }

  if (eval("document.form1." + sectionName + "_top_" + bayName).value) {
    topQty = parseFloat(eval("document.form1." + sectionName + "_top_" + bayName).value)
  }

  if (eval("document.form1." + sectionName + "_middle_" + bayName).value) {
    middleQty = parseFloat(eval("document.form1." + sectionName + "_middle_" + bayName).value)
  }

  if (eval("document.form1." + sectionName + "_bottom_" + bayName).value) {
    bottomQty = parseFloat(eval("document.form1." + sectionName + "_bottom_" + bayName).value)
  }
    
  tmpTotal = topQty + middleQty + bottomQty;

  if (bayTotal != tmpTotal) {
    alert('Sum of Bay is different from Bay Total in Wall Section.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }
  
  flagObj = null;
}

function fnCheckSectionTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var sectionTotal = 0;
  var objName = obj.name;                 // name format : s1_bay_total
  var sectionName = objName.substring(0, objName.indexOf("_"));

  if (obj.value) {
    sectionTotal = parseFloat(obj.value);
  }
  
  for (var i = 1; i <= 12; i++) {
    tmpTotal += eval("document.form1." + sectionName + "_bay" + i + "_total").value ?
                  parseFloat(eval("document.form1." + sectionName + "_bay" + i + "_total").value) : 0;
  }

  if (sectionTotal != tmpTotal) {
    alert('Sum of Section is different from Section Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }
  
  flagObj = null;
}

function fnCheckWallApparelTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var wallApparelTotal = 0;

  if (obj.value) {
    wallApparelTotal = parseFloat(obj.value);
  }

  for (var i = 1; i <= 10; i++) {
    tmpTotal += eval("document.form1.s" + i + "_bay_total").value ?
                  parseFloat(eval("document.form1.s" + i + "_bay_total").value) : 0;
  }

  if (wallApparelTotal != tmpTotal) {
    alert('Sum of Wall Section(Apparel) is different from Wall(Apparel) Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnCheckWallNonApparelTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var wallNonApparelTotal = 0;

  if (obj.value) {
    wallNonApparelTotal = parseFloat(obj.value);
  }

  for (var i = 1; i <= 10; i++) {
    tmpTotal += eval("document.form1.s" + i + "_nonapparel").value ?
                  parseFloat(eval("document.form1.s" + i + "_nonapparel").value) : 0;
  }

  if (wallNonApparelTotal != tmpTotal) {
    alert('Sum of Wall Section(Non Apparel) is different from Wall(Non Apparel) Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnCheckRackTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var rackTotal = 0;
  var objName = obj.name;                 // name format : rack1_total
  var rackNum = parseFloat(objName.substring(4, objName.indexOf("_")));

  if (obj.value) {
    rackTotal = parseFloat(obj.value);
  }

  for (var i = 1; i <= 13; i++) {
    tmpTotal += eval("document.form1.rack" + ((rackNum-1)*13 + i)).value ?
                  parseFloat(eval("document.form1.rack" + ((rackNum-1)*13 + i)).value) : 0;
  }

  if (rackTotal != tmpTotal) {
    alert('Sum of Rack is different from Rack Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnStoreRoomBayTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var topQty = 0;
  var middleQty = 0;
  var bottomQty = 0;
  var tmpTotal = 0;
  var bayTotal = 0;
  var objName = obj.name;                 // name format : store_bay1_total
  var bayName = objName.substring(objName.indexOf("_")+1, objName.lastIndexOf("_"));

  // if values are not input, do not check
  if (!eval("document.form1.store_top_" + bayName).value
      && !eval("document.form1.store_middle_" + bayName).value
      && !eval("document.form1.store_bottom_" + bayName).value
      && !obj.value) {
    return;
  }

  if (obj.value) {
    bayTotal = parseFloat(obj.value);
  }

  if (eval("document.form1.store_top_" + bayName).value) {
    topQty = parseFloat(eval("document.form1.store_top_" + bayName).value)
  }

  if (eval("document.form1.store_middle_" + bayName).value) {
    middleQty = parseFloat(eval("document.form1.store_middle_" + bayName).value)
  }

  if (eval("document.form1.store_bottom_" + bayName).value) {
    bottomQty = parseFloat(eval("document.form1.store_bottom_" + bayName).value)
  }

  tmpTotal = topQty + middleQty + bottomQty;

  if (bayTotal != tmpTotal) {
    alert('Sum of Bay is different from Bay Total in Store Room.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }
  
  flagObj = null;
}

function fnCheckStoreRoomTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var storeRoomTotal = 0;
  var objName = obj.name;                 // name format : store1_total
  var storeRoomNum = parseFloat(objName.substring(5, objName.indexOf("_")));

  if (obj.value) {
    storeRoomTotal = parseFloat(obj.value);
  }

  for (var i = 1; i <= 13; i++) {
    tmpTotal += eval("document.form1.store_bay" + ((storeRoomNum-1)*13 + i) + "_total").value ?
                  parseFloat(eval("document.form1.store_bay" + ((storeRoomNum-1)*13 + i) + "_total").value) : 0;
  }

  if (storeRoomTotal != tmpTotal) {
    alert('Sum of Bay Total is different from Total in Store Room.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnCheckOtherAreaTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var otherAreaTotal = 0;

  if (obj.value) {
    otherAreaTotal = parseFloat(obj.value);
  }

  if (document.form1.other_jumper.value) {
    tmpTotal += parseFloat(document.form1.other_jumper.value);
  }
  
  if (document.form1.other_unscanned.value) {
    tmpTotal += parseFloat(document.form1.other_unscanned.value);
  }
  
  if (document.form1.other_counter.value) {
    tmpTotal += parseFloat(document.form1.other_counter.value);
  }
  
  if (document.form1.other_mannequin.value) {
    tmpTotal += parseFloat(document.form1.other_mannequin.value);
  }
  
  for (var i = 1; i <= 2; i++) {
    if (eval('document.form1.other_area_qty' + i).value) {
      tmpTotal += parseFloat(eval('document.form1.other_area_qty' + i).value);
    }
  }

  if (otherAreaTotal != tmpTotal) {
    alert('Sum of Other Area is different from Other Area Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnCheckUnopenedCartonTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  // if Number of unopened carton is greater than 10, do not check total
  var numberOfUnopenedCarton = document.form1.unopened_number_of.value ?
                                 parseFloat(document.form1.unopened_number_of.value) : 0;
  if (numberOfUnopenedCarton > 10) {
    return;
  }

  var tmpTotal = 0;
  var unopenedCartonTotal = 0;

  if (obj.value) {
    unopenedCartonTotal = parseFloat(obj.value);
  }

  for (var i = 1; i <= 10; i++) {
    tmpTotal += eval("document.form1.unopened_carton" + i).value ?
                  parseFloat(eval("document.form1.unopened_carton" + i).value) : 0;
  }

  if (unopenedCartonTotal != tmpTotal) {
    alert('Sum of Carton is different from Cartons Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnCheckNonApparelTotal(obj) {
  if (flagObj != null && flagObj != obj) {
    return;
  }

  var tmpTotal = 0;
  var nonApparelTotal = 0;

  if (obj.value) {
    nonApparelTotal = parseFloat(obj.value);
  }

  if (document.form1.nonapparel_store.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_store.value);
  }
  
  if (document.form1.nonapparel_jumper.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_jumper.value);
  }
  
  if (document.form1.nonapparel_unscanned.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_unscanned.value);
  }
  
  if (document.form1.nonapparel_counter.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_counter.value);
  }
  
  if (document.form1.nonapparel_mannequin.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_mannequin.value);
  }
  
  if (document.form1.nonapparel_sunglass1.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_sunglass1.value);
  }
  
  if (document.form1.nonapparel_sunglass2.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_sunglass2.value);
  }
  
  if (document.form1.nonapparel_slat1.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_slat1.value);
  }
  
  if (document.form1.nonapparel_slat2.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_slat2.value);
  }
  
  if (document.form1.nonapparel_mobile1.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_mobile1.value);
  }
  
  if (document.form1.nonapparel_mobile2.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_mobile2.value);
  }
  
  if (document.form1.nonapparel_floor.value) {
    tmpTotal += parseFloat(document.form1.nonapparel_floor.value);
  }

  if (nonApparelTotal != tmpTotal) {
    alert('Sum of Non Apparel is different from Non Apparel Total.\nCheck your data.');
    obj.select();
    flagObj = obj;
    return;
  }

  flagObj = null;
}

function fnSubmit(frm) {
  if (!frm.start_time_hh.value) {
    alert('Input Start Time.');
    frm.start_time_hh.focus();
    return;
  }

  if (!frm.start_time_mi.value) {
    alert('Input Start Time.');
    frm.start_time_mi.focus();
    return;
  }

  if (!frm.finish_time_hh.value) {
    alert('Input Finish Time.');
    frm.finish_time_hh.focus();
    return;
  }

  if (!frm.finish_time_mi.value) {
    alert('Input Finish Time.');
    frm.finish_time_mi.focus();
    return;
  }

  var start_time = frm.start_time_hh.value + frm.start_time_mi.value;
  var finish_time = frm.finish_time_hh.value + frm.finish_time_mi.value;

  if (start_time > finish_time) {
    alert('Finish Time should be greater than Start Time.\nCheck your data.');
    frm.finish_time_hh.focus();
    return;
  }

  if (!jf_ChkValue(frm.staffname1.value)) {
    alert('Input Staff Name1.');
    frm.staffname1.select();
    return;
  }

  if (!jf_ChkValue(frm.staffname2.value)) {
    alert('Input Staff Name2.');
    frm.staffname2.select();
    return;
  }


  // validate wall section
  var s_apparel_total = 0;
  var s_nonapparel_total = 0;
  var s_bay_total = new Array(13);
  var s_total = 0;

  for (var i = 1; i <= 10; i++) {
    // initialise
    s_total = 0;
    
    for (var j = 1; j <= 12; j++) {
      s_bay_total[j] = 0;
    }
    
    // check data
    for (var j = 1; j <= 12; j++) {
      if (eval('document.form1.s' + i + '_top_bay' + j).value) {
        s_bay_total[j] += parseFloat(eval('document.form1.s' + i + '_top_bay' + j).value);
      }

      if (eval('document.form1.s' + i + '_middle_bay' + j).value) {
        s_bay_total[j] += parseFloat(eval('document.form1.s' + i + '_middle_bay' + j).value);
      }

      if (eval('document.form1.s' + i + '_bottom_bay' + j).value) {
        s_bay_total[j] += parseFloat(eval('document.form1.s' + i + '_bottom_bay' + j).value);
      }

      // check bay total
      var s_bay_total_tmp = 0;

      if (eval('document.form1.s' + i + '_bay' + j + '_total').value) {
        s_bay_total_tmp = parseFloat(eval('document.form1.s' + i + '_bay' + j + '_total').value);
      }
      
      if (s_bay_total[j] != s_bay_total_tmp) {
        alert('Sum of Bay' + j + ' is different from Bay' + j + ' Total in Wall Section' + i + '.\nCheck your data.');
        eval('document.form1.s' + i + '_bay' + j + '_total').select();
        return;
      }
      
      // sum section total
      s_total += s_bay_total_tmp;
    }

    // check section total
    var s_total_tmp = 0;
    
    if (eval('document.form1.s' + i + '_bay_total').value) {
      s_total_tmp = parseFloat(eval('document.form1.s' + i + '_bay_total').value);
    }

    if (s_total != s_total_tmp) {
      alert('Sum of Section' + i + ' is different from Section' + i + ' Total.\nCheck your data.');
      eval('document.form1.s' + i + '_bay_total').select();
      return;
    }
    
    // sum apparel, nonapparel total
    var s_nonapparel_tmp = 0;

    if (eval('document.form1.s' + i + '_nonapparel').value) {
      s_nonapparel_tmp = parseFloat(eval('document.form1.s' + i + '_nonapparel').value);
    }

    s_apparel_total += s_total_tmp;
    s_nonapparel_total += s_nonapparel_tmp;
    
    // check staff name
    if (s_total_tmp > 0 || s_nonapparel_tmp > 0) {
      if (!jf_ChkValue(eval('document.form1.s'+ i + '_staffname').value)) {
        alert('Input Staff(Initial) in Wall Section' + i + '.');
        eval('document.form1.s'+ i + '_staffname').select();
        return;
      }
    }
  }

  // check apparel, nonapparel total
  var s_apparel_total_tmp = 0;
  var s_nonapparel_total_tmp = 0;
  
  if (frm.s_wall_apparel_total.value) {
    s_apparel_total_tmp = parseFloat(frm.s_wall_apparel_total.value);
  }
  
  if (frm.s_wall_nonapparel_total.value) {
    s_nonapparel_total_tmp = parseFloat(frm.s_wall_nonapparel_total.value);
  }

  if (s_apparel_total != s_apparel_total_tmp) {
    alert('Sum of Wall Section(Apparel) is different from Wall(Apparel) Total.\nCheck your data.');
    frm.s_wall_apparel_total.select();
    return;
  }

  if (s_nonapparel_total != s_nonapparel_total_tmp) {
    alert('Sum of Wall Section(Non Apparel) is different from Wall(Non Apparel) Total.\nCheck your data.');
    frm.s_wall_nonapparel_total.select();
    return;
  }
/*
  if (s_apparel_total == 0) {
    alert('Input Wall qty.');
    frm.s1_top_bay1.select();
    return;
  }
*/

  // validate rack
  var rack_total = 0;
  var rack_sum = 0;
  
  for (var i = 0; i < 3; i++) {
    rack_total = 0;
    
    for (var j = 1; j <= 13; j++) {
      if (eval('document.form1.rack' + (i*13 + j)).value) {

        // check staff name
        if (!jf_ChkValue(eval('document.form1.rack' + (i*13 + j) + '_staffname').value)) {
          alert('Input Staff(Initial) in Rack' + (i*13 + j) + '.');
          eval('document.form1.rack'+ (i*13 + j) + '_staffname').select();
          return;
        }

        rack_total += parseFloat(eval('document.form1.rack' + (i*13 + j)).value);
      }
    }

    // check rack total
    var rack_total_tmp = 0;

    if (eval('document.form1.rack' + (i+1) + '_total').value) {
      rack_total_tmp = parseFloat(eval('document.form1.rack' + (i+1) + '_total').value);
    }
    
    if (rack_total != rack_total_tmp) {
      alert('Sum of Rack is different from Rack Total.\nCheck your data.');
      eval('document.form1.rack' + (i+1) + '_total').select();
      return;
    }
    
    rack_sum += rack_total_tmp;
  }
/*
  if (rack_sum == 0) {
    alert('Input Rack (Apparel Only) qty.');
    frm.rack1.select();
    return;
  }
*/

  // validate store room
  var store_total = 0;
  var store_bay_total = new Array(27);
  var store_sum = 0;

  for (var i = 1; i <= 26; i++) {
    store_bay_total[i] = 0;
  }

  for (var i = 0; i < 2; i++) {
    // initialise
    store_total = 0;

    // check data
    for (var j = 1; j <= 13; j++) {
      if (eval('document.form1.store_top_bay' + (i*13 + j)).value) {
        store_bay_total[i*13 + j] += parseFloat(eval('document.form1.store_top_bay' + (i*13 + j)).value);
      }

      if (eval('document.form1.store_middle_bay' + (i*13 + j)).value) {
        store_bay_total[i*13 + j] += parseFloat(eval('document.form1.store_middle_bay' + (i*13 + j)).value);
      }

      if (eval('document.form1.store_bottom_bay' + (i*13 + j)).value) {
        store_bay_total[i*13 + j] += parseFloat(eval('document.form1.store_bottom_bay' + (i*13 + j)).value);
      }

      // check bay total
      var store_bay_total_tmp = 0;

      if (eval('document.form1.store_bay' + (i*13 + j) + '_total').value) {
        store_bay_total_tmp = parseFloat(eval('document.form1.store_bay' + (i*13 + j) + '_total').value);
      }
      
      if (store_bay_total[i*13 + j] != store_bay_total_tmp) {
        alert('Sum of Bay' + (i*13 + j) + ' is different from Bay' + (i*13 + j) + ' Total in Store Room.\nCheck your data.');
        eval('document.form1.store_bay' + (i*13 + j) + '_total').select();
        return;
      }

      // check staff name
      if (store_bay_total_tmp > 0) {
        if (!jf_ChkValue(eval('document.form1.store_bay' + (i*13 + j) + '_staffname').value)) {
          alert('Input Staff(Initial) in Store Room Bay' + (i*13 + j) + '.');
          eval('document.form1.store_bay' + (i*13 + j) + '_staffname').select();
          return;
        }
      }

      // sum section total
      store_total += store_bay_total_tmp;
    }

    // check sub total
    var store_total_tmp = 0;

    if (eval('document.form1.store' + (i+1) + '_total').value) {
      store_total_tmp = parseFloat(eval('document.form1.store' + (i+1) + '_total').value);
    }

    if (store_total != store_total_tmp) {
      alert('Sum of Bay is different from Bay Total in Store Room.\nCheck your data.');
      eval('document.form1.store' + (i+1) + '_total').select();
      return;
    }
    
    store_sum += store_total_tmp;
  }
/*
  if (store_sum == 0) {
    alert('Input Store Room (Apparel Only) qty.');
    frm.store_top_bay1.select();
    return;
  }
*/
  
  // validate Other Area
  for (var i = 1; i <= 2; i++) {
    if (eval('document.form1.other_area_qty' + i).value) {
      if (!jf_ChkValue(eval('document.form1.other_area_name' + i).value)) {
        alert('Input Area Name.');
        eval('document.form1.other_area_name' + i).select();
        return;
      }
    }
  }
  
  var other_area_sum = 0;
  var other_area_total_tmp = 0;
  
  if (frm.other_jumper.value) {
    other_area_sum += parseFloat(frm.other_jumper.value);
  }
  
  if (frm.other_unscanned.value) {
    other_area_sum += parseFloat(frm.other_unscanned.value);
  }
  
  if (frm.other_counter.value) {
    other_area_sum += parseFloat(frm.other_counter.value);
  }
  
  if (frm.other_mannequin.value) {
    other_area_sum += parseFloat(frm.other_mannequin.value);
  }
  
  for (var i = 1; i <= 2; i++) {
    if (eval('document.form1.other_area_qty' + i).value) {
      other_area_sum += parseFloat(eval('document.form1.other_area_qty' + i).value);
    }
  }

    
  if (frm.other_area_total.value) {
    other_area_total_tmp += parseFloat(frm.other_area_total.value);
  }
  
  if (other_area_sum != other_area_total_tmp) {
    alert('Sum of Other Area is different from Other Area Total.\nCheck your data.');
    frm.other_area_total.select();
    return;
  }


  // validate unopened cartons
  var unopened_number_of_tmp = 0;
  var unopened_carton_total_tmp = 0;
  var unopened_carton_sum = 0;
  var unopened_carton_cnt = 0;

  if (frm.unopened_number_of.value) {
    unopened_number_of_tmp = parseFloat(frm.unopened_number_of.value);
  }

  if (unopened_number_of_tmp <= 10) {
    for (var i = 1; i <= 10; i++) {
      if (eval('document.form1.unopened_carton' + i).value) {
        var unopened_carton_tmp = parseFloat(eval('document.form1.unopened_carton' + i).value);
        
        if (unopened_carton_tmp > 0) {
          unopened_carton_sum += unopened_carton_tmp;
          unopened_carton_cnt++;
        }
      }
    }
    
    if (unopened_number_of_tmp != unopened_carton_cnt) {
      alert('Total Number of Carton is different from Count of Cartons.\nCheck your data.');
      frm.unopened_number_of.select();
      return;
    }
    
    if (frm.unopened_carton_total.value) {
      unopened_carton_total_tmp = parseFloat(frm.unopened_carton_total.value);
    }
    
    if (unopened_carton_sum != unopened_carton_total_tmp) {
      alert('Sum of Carton is different from Cartons Total.\nCheck your data.');
      frm.unopened_carton_total.select();
      return;
    }
  }
  
  
  // validate non apparel
  var nonapparel_sum = 0;
  var nonapparel_total_tmp = 0;
  
  if (frm.nonapparel_store.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_store.value);
  }
  
  if (frm.nonapparel_jumper.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_jumper.value);
  }
  
  if (frm.nonapparel_unscanned.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_unscanned.value);
  }
  
  if (frm.nonapparel_counter.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_counter.value);
  }
  
  if (frm.nonapparel_mannequin.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_mannequin.value);
  }
  
  if (frm.nonapparel_sunglass1.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_sunglass1.value);
  }
  
  if (frm.nonapparel_sunglass2.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_sunglass2.value);
  }
  
  if (frm.nonapparel_slat1.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_slat1.value);
  }
  
  if (frm.nonapparel_slat2.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_slat2.value);
  }
  
  if (frm.nonapparel_mobile1.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_mobile1.value);
  }
  
  if (frm.nonapparel_mobile2.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_mobile2.value);
  }
  
  if (frm.nonapparel_floor.value) {
    nonapparel_sum += parseFloat(frm.nonapparel_floor.value);
  }

  if (frm.nonapparel_total.value) {
    nonapparel_total_tmp = parseFloat(frm.nonapparel_total.value);
  }

  if (nonapparel_sum != nonapparel_total_tmp) {
    alert('Sum of Non Apparel is different from Non Apparel Total.\nCheck your data.');
    frm.nonapparel_total.select();
    return;
  }

  if (!confirm("Do you really want to submit these data?")) {
    return;
  }

  frm.action = "./stock_input.jsp";
  frm.submit();
}

function fnViewHistory() {
  document.location.href = './stock_report.jsp';
}
</SCRIPT>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="840" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<table border="0" cellspacing="0" width="812" id="AutoNumber1" height="55">   
    <tr>
        <TD COLSPAN=2 align="CENTER" width=812 ><font color=#424242 size=4 face="Georgia"><b>STOCK COUNTING FORM<b><font></td>
     </tr>
</table>

<table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
<form name="form1" method="post">
<tr>
  <td width='12%' class="table_header_center">Store Name</td>
  <td width='19%' class="table_bg_bright"><%= shopname %></td>
  <td width='14%' class="table_header_center">Date</td>
  <td width='24%' class="table_bg_bright"><input type='text' name='sdate' value='<%= today %>' size='10' readonly class='input_text'>
    <img src="/img/calendar.gif" style="cursor:hand" align="absmiddle" onclick="javascript:popFrame.fPopCalendar(this, document.form1.sdate, document.all['popCal'], 'RIGHT');"></td>
  <td width='12%' class="table_header_center">Staff Name1</td>
  <td width='19%' class="table_bg_bright"><input type='text' name='staffname1' size='24' maxlength='30' class='input_text'></td>
</tr>
<tr>
  <td class="table_header_center">Staff Name</td>
  <td class="table_bg_bright"><%= staffname %></td>
  <td class="table_header_center">Start &amp; Finish Time</td>
  <td class="table_bg_bright"><select name='start_time_hh'><%= optionHh %></select>:<select name='start_time_mi'><%= optionMi %></select>
    TO <select name='finish_time_hh'><%= optionHh %></select>:<select name='finish_time_mi'><%= optionMi %></select></td>
  <td class="table_header_center">Staff Name2</td>
  <td class="table_bg_bright"><input type='text' name='staffname2' size='24' maxlength='30' class='input_text'></td>
</tr>
<tr>
  <td class="table_header_center">Staff Id</td>
  <td class="table_bg_bright"><%= staffid %></td>
  <td class="table_header_center">&nbsp;</td>
  <td class="table_bg_bright">&nbsp;</td>
  <td class="table_header_center">Staff Name3</td>
  <td class="table_bg_bright"><input type='text' name='staffname3' size='24' maxlength='30' class='input_text'></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><span style='font-weight: bold;'>1. WALL</span></td>
</tr>
</table>
<table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
<tr class="table_header_center">
  <td width='91%' colspan='16'>Apparel Only</td>
  <td width='1%' rowspan='2'>&nbsp;</td>
  <td width='8%'>Non Apparel</td>
</tr>
<tr class="table_header_center">
  <td width='8%'>NO</td>
  <td width='8%'>Staff<br>(Initial)</td>
  <td width='8%'>BAR</td>
<%
for (int j = 1; j <= 12; j++) {
%>
  <td width='5%'>Bay<%= j %></td>
<%
}
%>
  <td width='7%'>TOTAL</td>
  <td width='8%'>S1</td>
</tr>
<%
for (int i = 1; i <= 10; i++) {
%>
  <tr class="table_bg_bright_center">
    <td rowspan='4' class="table_header_center">S<%= i %></td>
    <td rowspan='4'><input type='text' name='s<%= i %>_staffname' size='6' maxlength='10' class='input_text'></td>
    <td class="table_header_center">TOP</td>
<%
  for (int j = 1; j <= 12; j++) {
%>
    <td><input type='text' name='s<%= i %>_top_bay<%= j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
    <td rowspan='3'>&nbsp;</td>
    <td rowspan='3'>&nbsp;</td>
    <td rowspan='3'><input type='text' name='s<%= i %>_nonapparel' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
  </tr>
  <tr class="table_bg_bright_center">
    <td class="table_header_center">MIDDLE</td>
<%
  for (int j = 1; j <= 12; j++) {
%>
    <td><input type='text' name='s<%= i %>_middle_bay<%= j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
  </tr>
  <tr class="table_bg_bright_center">
    <td class="table_header_center">BOTTOM</td>
<%
  for (int j = 1; j <= 12; j++) {
%>
    <td><input type='text' name='s<%= i %>_bottom_bay<%= j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
  </tr>
  <tr class="table_header_center">
    <td>TOTAL</td>
<%
  for (int j = 1; j <= 12; j++) {
%>
    <td><input type='text' name='s<%= i %>_bay<%= j %>_total' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckBayTotal(this);' class="input_text_right"></td>
<%
  }
%>
    <td><input type='text' name='s<%= i %>_bay_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckSectionTotal(this);' class="input_text_right"></td>
    <td>&nbsp;</td>
    <td><%= i < 10 ? "S"+(i+1) : "TOTAL<br>(Non Ap.)" %></td>
  </tr>
<%
}
%>
<tr class="table_header_center">
  <td colspan='13'>&nbsp;</td>
  <td colspan='2'>TOTAL<br>(Apparel)</td>
  <td><input type='text' name='s_wall_apparel_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckWallApparelTotal(this);' class="input_text_right"></td>
  <td>&nbsp;</td>
  <td><input type='text' name='s_wall_nonapparel_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckWallNonApparelTotal(this);' class="input_text_right"></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><span style='font-weight: bold;'>2. Rack (Apparel Only)</span></td>
</tr>
</table>
<table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
<%
for (int i = 0; i < 3; i++) {
%>
  <tr class="table_header_center">
    <td width='12%'>Staff (Initial)</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td width='6%'><input type='text' name='rack<%= i*13 + j %>_staffname' size='5' maxlength='10' class='input_text'></td>
<%
  }
%>
    <td width='1%' rowspan='2'>&nbsp;</td>
    <td width='11%' rowspan='2'>TOTAL</td>
  </tr>
  <tr class="table_header_center">
    <td>RACK NO.</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td>Rack<%= i*13 + j %></td>
<%
  }
%>
  </tr>
  <tr class="table_bg_bright_center">
    <td>Qty</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td><input type='text' name='rack<%= i*13 + j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
    <td>&nbsp;</td>
    <td><input type='text' name='rack<%= i+1 %>_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckRackTotal(this);' class="input_text_right"></td>
  </tr>
<%
  if (i < 2) {
%>
  <tr class="table_bg_bright_center">
    <td colspan='16' height='1' style='line-height:1px;'><span style='font-size:1;'>&nbsp;</span></td>
  </tr>
<%
  }
}
%>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%"><span style='font-weight: bold;'>3. Store Room (Apparel Only)</span></td>
</tr>
</table>
<table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
<%
for (int i = 0; i < 2; i++) {
%>
  <tr class="table_header_center">
    <td width='12%'>Staff (Initial)</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td width='6%'><input type='text' name='store_bay<%= i*13 + j %>_staffname' size='5' maxlength='10' class='input_text'></td>
<%
  }
%>
    <td width='1%' rowspan='2'>&nbsp;</td>
    <td width='11%' rowspan='2'>TOTAL</td>
  </tr>
  <tr class="table_header_center">
    <td>BAR</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td>Bay<%= i*13 + j %></td>
<%
  }
%>
  </tr>
  <tr class="table_bg_bright_center">
    <td>TOP</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td><input type='text' name='store_top_bay<%= i*13 + j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
    <td rowspan='3'>&nbsp;</td>
    <td rowspan='3'>&nbsp;</td>
  </tr>
  <tr class="table_bg_bright_center">
    <td>MIDDLE</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td><input type='text' name='store_middle_bay<%= i*13 + j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
  </tr>
  <tr class="table_bg_bright_center">
    <td>BOTTOM</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td><input type='text' name='store_bottom_bay<%= i*13 + j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
<%
  }
%>
  </tr>
  <tr class="table_header_center">
    <td>TOTAL</td>
<%
  for (int j = 1; j <= 13; j++) {
%>
    <td><input type='text' name='store_bay<%= i*13 + j %>_total' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" onblur='fnStoreRoomBayTotal(this);' class="input_text_right"></td>
<%
  }
%>
    <td>&nbsp;</td>
    <td><input type='text' name='store<%= i+1 %>_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckStoreRoomTotal(this);' class="input_text_right"></td>
  </tr>
<%
  if (i == 0) {
%>
  <tr class="table_bg_bright_center">
    <td colspan='16' height='5' style='line-height:5px;'><span style='font-size:5;'>&nbsp;</span></td>
  </tr>
<%
  }
}
%>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr valign='top'>
  <td width="30%"><table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="100%"><span style='font-weight: bold;'>4. Other Area (Apparel Only)</span></td>
    </tr>
    </table>
    <table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
    <tr class="table_header_center">
      <td width='60%'>AREA NAME</td>
      <td width='40%'>QTY</td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Jumper Table</td>
      <td><input type='text' name='other_jumper' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Unscanned Faulty</td>
      <td><input type='text' name='other_unscanned' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Counter Area</td>
      <td><input type='text' name='other_counter' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Mannequin</td>
      <td><input type='text' name='other_mannequin' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td><input type='text' name='other_area_name1' size='16' maxlength='30' class="input_text"></td>
      <td><input type='text' name='other_area_qty1' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td><input type='text' name='other_area_name2' size='16' maxlength='30' class="input_text"></td>
      <td><input type='text' name='other_area_qty2' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_header_center">
      <td>TOTAL</td>
      <td><input type='text' name='other_area_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckOtherAreaTotal(this);' class="input_text_right"></td>
    </tr>
    </table>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="100%" height="15"></td>
    </tr>
    </table>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="100%"><span style='font-weight: bold;'>7. Fitting Room Tag</span></td>
    </tr>
    </table>
    <table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
    <tr class="table_header_center">
      <td width='26%'>Number</td>
      <td width='24%'>Qty</td>
      <td width='26%'>Number</td>
      <td width='24%'>Qty</td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>No1</td>
      <td><input type='text' name='fitting_room_tag1' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
      <td>No2</td>
      <td><input type='text' name='fitting_room_tag2' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>No3</td>
      <td><input type='text' name='fitting_room_tag3' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
      <td>No4</td>
      <td><input type='text' name='fitting_room_tag4' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>No5</td>
      <td><input type='text' name='fitting_room_tag5' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
      <td>No6</td>
      <td><input type='text' name='fitting_room_tag6' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    </table></td>
  <td width="5%"></td>
  <td width="30%"><table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="100%"><span style='font-weight: bold;'>5. Unopened Cartons (Apparel Only)</span></td>
    </tr>
    </table>
    <table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
    <tr>
      <td width='30%' rowspan='13' class="table_header_center">RECEIVED BEFORE TODAY</td>
      <td width='40%' class="table_header_center">TOTAL.NO OF CARTON</td>
      <td width='30%' class="table_bg_bright_center"><input type='text' name='unopened_number_of' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr>
      <td class="table_header_center">Carton No.</td>
      <td class="table_header_center">Qty</td>
    </tr>
<%
for (int j = 1; j <= 10; j++) {
%>
    <tr>
      <td class="table_bg_bright_center">Carton No. <%= j %></td>
      <td class="table_bg_bright_center"><input type='text' name='unopened_carton<%= j %>' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
<%
}
%>
    <tr>
      <td class="table_header_center">TOTAL</td>
      <td class="table_header_center"><input type='text' name='unopened_carton_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();"  onblur='fnCheckUnopenedCartonTotal(this);' class="input_text_right"></td>
    </tr>
    </table></td>
  <td width="5%"></td>
  <td width="30%"><table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
      <td width="100%"><span style='font-weight: bold;'>6. *** Non Apparel ***</span></td>
    </tr>
    </table>
    <table width="99%" border="1" cellspacing="0" cellpadding="2" align="center" class="table_bg">
    <tr class="table_header_center">
      <td width='60%'>AREA NAME</td>
      <td width='40%'>QTY</td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Store Room</td>
      <td><input type='text' name='nonapparel_store' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Jumper Table</td>
      <td><input type='text' name='nonapparel_jumper' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Unscanned Faulty</td>
      <td><input type='text' name='nonapparel_unscanned' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Counter Area</td>
      <td><input type='text' name='nonapparel_counter' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Mannequin</td>
      <td><input type='text' name='nonapparel_mannequin' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Sunglass Rack1</td>
      <td><input type='text' name='nonapparel_sunglass1' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Sunglass Rack1</td>
      <td><input type='text' name='nonapparel_sunglass2' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Slat Wall1</td>
      <td><input type='text' name='nonapparel_slat1' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Slat Wall2</td>
      <td><input type='text' name='nonapparel_slat2' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Mobile Rack1</td>
      <td><input type='text' name='nonapparel_mobile1' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Mobile Rack2</td>
      <td><input type='text' name='nonapparel_mobile2' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_bg_bright_center">
      <td>Floor Rack</td>
      <td><input type='text' name='nonapparel_floor' size='3' maxlength='3' onkeypress="return jf_EventNumberCheck();" class="input_text_right"></td>
    </tr>
    <tr class="table_header_center">
      <td>TOTAL</td>
      <td><input type='text' name='nonapparel_total' size='5' maxlength='5' onkeypress="return jf_EventNumberCheck();" onblur='fnCheckNonApparelTotal(this);' class="input_text_right"></td>
    </tr>
    </table></td>
</tr>
</table>

<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" height="15"></td>
</tr>
</table>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td width="100%" align="center">
    <input type="button" value="SUBMIT" onclick="fnSubmit(this.form);" class="button_default">
    <input type="reset" value="RESET" class="button_default">
    <input type="button" value="VIEW HISTORY" onclick="fnViewHistory();" class="button_default_medium">
  </td>
</tr>
</table>
</form>

</td></tr></table>
</body>
</html>
