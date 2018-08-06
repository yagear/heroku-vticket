﻿<%@ Page Language="C#" MasterPageFile="~/Master/osaka.front.master"%>

<asp:Content ID="indexMainContent" ContentPlaceHolderID="MainContent" Runat="Server">
<script type="text/javascript" src="//jpostal-1006.appspot.com/jquery.jpostal.js"></script>
<script type="text/javascript">
$(window).ready( function() {
/* 郵便番号用 */
	$('#zip').jpostal({
		postcode : [	'#zip'],
		address : {
			'#addr1'  : '%3%4%5',
			'#addr2'  : ''
		}
	});
/* フォームクリアボタン用 */
    $('.has-clear input[type="text"]').on('focus input', function() {
        var $this = $(this);
        var visible = Boolean($this.val());
        $this.siblings('.control-clear').toggleClass('hidden', !visible);
    }).on('blur', function() {
        $(this).siblings('.control-clear').addClass('hidden');
    }).trigger('propertychange');

    $('.control-clear').on('mousedown', function() {
        return false;
    }).click(
    function() {
        $(this).siblings('input[type="text"]').val('')
            .trigger('propertychange').focus();
    });});
</script>

<div id="main-contents" >

    <h2>送付先を設定します</h2>
    <form action="/vticket/application" method="post" id="address_setting">
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 input-group input-group-lg has-clear">
                <label class="input-group-addon" for="name" title="宛先となる氏名をご入力ください。"><span class="label label-danger">必須</span>宛先氏名</label>
                <span class="control-clear hidden"></span>
                <input placeholder="20文字以内となります" class="form-control" type="text" name="name" id="name"/>
            </div>
        </div>
        <div class="form-group has-error">
            <div class="col-xs-12 col-sm-12 input-group input-group-lg has-clear">
                <label class="input-group-addon" for="zip" title="ハイフンも含めて半角でご入力ください。"><span class="label label-danger">必須</span>郵便番号</label>
                <span class="control-clear hidden"></span>
                <input class="form-control" placeholder="例) 000-0000" type="text" name="zip" id="zip"/>
            </div>
            <div class="help-block">郵便番号は必須項目となります。</div>
        </div>
        <div class="form-group" id="form_addr1">
            <div class="col-xs-12 col-sm-12 input-group input-group-lg has-clear">
                <label class="input-group-addon" for="addr1" title="都道府県、市区町村、番地をご入力ください。 あふれる場合は住所２へ続きをご入力お願いします。"><span class="label label-danger">必須</span>住所１</label>
                <span class="control-clear hidden"></span>
                <input class="form-control" placeholder="20文字以内となります" type="text" name="addr1" id="addr1"/>
            </div>
        </div>
        <div class="form-group" id="form_addr2">
            <div class="col-xs-12 col-sm-12 input-group input-group-lg has-clear">
                <label class="input-group-addon" for="addr2" title="建物名など住所１に入らなかった場合もこちらをご利用ください。">住所２</label>
                <span class="control-clear hidden"></span>
                <input title="" data-toggle="tooltip" class="form-control" placeholder="20文字以内となります" type="text" name="addr2" id="addr2"/>
            </div>
        </div>
        <span class="address_tooltip"></span>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 input-group input-group-lg has-clear">
                <label class="input-group-addon" for="phone" title="市外局番から入力してください。ハイフンも含めて半角で。"><span class="label label-danger">必須</span>電話番号</label>
                <span class="control-clear hidden"></span>
                <input placeholder="例) 000-0000-0000" class="form-control" type="text" name="phone" id="phone"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 input-group input-group-lg has-clear">
                <label class="input-group-addon" for="mail"  title="電話での連絡が取れない際に利用するためのアドレスとなります。">メールアドレス</label>
                <span class="control-clear hidden"></span>
                <input placeholder="" class="form-control" type="text" name="mail" id="mail"/>
            </div>
        </div>
    
        <span class="annotation"></span>
        <button type="submit" name="registor" id="registor">登録</button>
    </form>

</div>
</asp:Content>