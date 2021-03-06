﻿<%@ page language="C#" autoeventwireup="true" inherits="Index, App_Web_dv99xhvn" enableEventValidation="false" %>

<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<%@ Register Src="Home/Room/UserControls/WebHead.ascx" TagName="WebHead" TagPrefix="uc1" %>
<%@ Register Src="Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=_Site.Name %>－彩票在线投注|福彩|体彩|足彩|高频彩|双色球开奖|双色球走势图查询-买彩票，就上<%=_Site.Name %></title>
    <meta name="description" content="<%=_Site.Name %>是一家服务于中国彩民的互联网彩票合买代购交易平台，涉及中国彩票彩种最全的网站，包含双色球、时时乐、时时彩、足彩等众多彩种的实时开奖信息、图表走势、分析预测等。" />
    <meta name="keywords" content="双色球开奖，双色球走势图，3d走势图，福彩3d，时时彩 体育彩票，福利彩票，足球彩票，合买彩票，购买彩票" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="Home/Room/Style/common.css" rel="stylesheet" type="text/css" />
    <link href="Home/Room/Style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="Home/Room/Style/index.css" rel="stylesheet" type="text/css" />

    <script src="JavaScript/index.js" type="text/javascript"></script>

    <script src="JavaScript/jquery-1.6.2.min.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HidIsuseID" runat="server" />
    <asp:HiddenField ID="HidIsuseEndTime" runat="server" />
    <asp:HiddenField ID="tb_LotteryNumber" runat="server" />
    <uc1:WebHead ID="WebHead1" runat="server" />
    <div class="i_main">
        <div class="left">
            <div id="draw_box" class="right_box lottery_margin">
                <div class="right_top">
                    <h1 class="kj_tit">
                        开奖公告</h1>
                    <ul class="kj_tab" id="Listli">
                        <li id="liaa" class="on" onclick="WinNumberLotteryList('divRepWinFuCai','divRepWinTiCai','divRepWinZuCai','liaa')">
                            福彩</li>
                        <li id="libb" onclick="WinNumberLotteryList('divRepWinTiCai','divRepWinFuCai','divRepWinZuCai','libb')">
                            体彩</li>
                        <li id="licc" onclick="WinNumberLotteryList('divRepWinZuCai','divRepWinTiCai','divRepWinFuCai','licc')">
                            足彩</li>
                    </ul>
                </div>
                <div class="right_main">
                    <div id="divRepWinFuCai" class="draw_contents" style="display: block;">
                        <ul class="kj_list">
                            <asp:Repeater ID="RepWinFuCai" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="padding-left: 5px">
                                                    <%#Eval("LotteryName")%>
                                                </td>
                                                <td style="padding-left: 8px">
                                                    <span style="color: Red">
                                                        <%#Eval("Name") %></span> 期
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-left: 5px; font-weight: bold; color: Red; height: 30px;">
                                                    <%#Eval("WinLotteryNumber")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div id="divRepWinTiCai" class="draw_contents" style="display: none;">
                        <ul class="kj_list">
                            <asp:Repeater ID="RepWinTiCai" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="padding-left: 5px">
                                                    <%#Eval("LotteryName")%>
                                                </td>
                                                <td style="padding-left: 8px">
                                                    <span style="color: Red">
                                                        <%#Eval("Name") %></span> 期
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-left: 5px; font-weight: bold; color: Red; height: 30px;">
                                                    <%#Eval("WinLotteryNumber")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div id="divRepWinZuCai" class="draw_contents" style="display: none;">
                        <ul class="kj_list">
                            <asp:Repeater ID="RepWinZuCai" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="padding-left: 5px">
                                                    <%#Eval("LotteryName") %>
                                                </td>
                                                <td style="padding-left: 8px">
                                                    <span style="color: Red">
                                                        <%#Eval("Name") %></span> 期
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-left: 5px; font-weight: bold; color: Red; height: 30px;">
                                                    <%#Eval("WinLotteryNumber")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right_box">
                <div class="right_top">
                    <h1>
                        中奖排行</h1>
                </div>
                <div class="right_main">
                    <table cellpadding="0" cellspacing="0" border="0" class="phb_tab">
                        <tr>
                            <td style="color: #DC0000; font-weight: bold" align="center">
                                No
                            </td>
                            <td style="color: #DC0000; font-weight: bold" align="center">
                                用户名
                            </td>
                            <td style="color: #DC0000; font-weight: bold" align="center">
                                中奖金
                            </td>
                        </tr>
                        <asp:Repeater ID="dTWinList" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <strong class="top3">
                                            <%# Container.ItemIndex+1%></strong>
                                    </td>
                                    <td class="align_left">
                                        <%#Eval("InitiateName")%>
                                    </td>
                                    <td align="center">
                                        ￥<%#Convert.ToDecimal(Eval("Win")).ToString("F2")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
            <div id="lottery_terminated_box" class="right_box">
                <div class="right_top">
                    <h1 class="czjz_tit">
                        彩种截止</h1>
                </div>
                <div class="right_main">
                    <table cellpadding="0" cellspacing="0" class="cztab" width="100%">
                        <tr class="tit">
                            <td>
                                彩种
                            </td>
                            <td>
                                期数
                            </td>
                            <td>
                                截止时间
                            </td>
                        </tr>
                        <asp:Repeater ID="dTEndIsuses" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("LotteryName")%>
                                    </td>
                                    <td>
                                        <%#Eval("Name")%>
                                    </td>
                                    <td>
                                        <%#Convert.ToDateTime(Eval("EndTime")).ToString("HH:mm:ss")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
            <div class="right_box">
                <div class="right_top">
                    <h1 class="czjz_tit">
                        专家栏目</h1>
                </div>
                <div class="right_main">
                    <table cellpadding="0" cellspacing="0" class="cztab" width="100%">
                        <tr class="tit">
                            <td>
                                用户名
                            </td>
                            <td>
                                彩种
                            </td>
                            <td>
                                跟单
                            </td>
                        </tr>
                        <asp:Repeater ID="dTFCExpert" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("UserName")%>
                                    </td>
                                    <td>
                                        <%#Eval("LotteryName")%>
                                    </td>
                                    <td>
                                        <a href="Home/Room/FollowSchemeHistory.aspx">定制 </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="top">
                <div class="top_left">
                    <div class="slide">
                        <div id="slides">
                            <div class="slides_container">
                                <ShoveWebUI:ShoveImagePlayer ID="ImagePlayer" runat="server" SupportDir="ShoveWebUI_client"
                                    imgHeight="198" imgWidth="522" TimeOut="3" />
                            </div>
                        </div>
                    </div>
                    <div class="broadcast">
                        <h1>
                            中奖播报</h1>
                        <iframe id="iframeTotalWinNotice" style="float: left; display: inline; width: 432px;
                            height: 26px; overflow: hidden;" name="iframeTotalWinNotice" width="100%" height="26px"
                            frameborder="0" scrolling="no" src="<%=ResolveUrl("~/Home/Room/WinNotice.aspx") %>">
                        </iframe>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                <div id="index_login" class="login hidden">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" id="tbLogin1" runat="server">
                        <tr>
                            <td colspan="2">
                                <h1>
                                    会员登录</h1>
                            </td>
                        </tr>
                        <tr>
                            <td class="t">
                                用户名：
                            </td>
                            <td>
                                <input type="text" class="text" id="txtUersName" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="t">
                                密 &nbsp;&nbsp;码：
                            </td>
                            <td>
                                <input type="password" class="text" id="textUersPwd" runat="server" />
                            </td>
                        </tr>
                        <tr id="textCheckCodeHidden" runat="server">
                            <td class="t">
                                验证码：
                            </td>
                            <td>
                                <input type="text" class="text imgcode" name="verify" id="textCheckCode" runat="server" />
                                <img id="ImageCheckAdmin" runat="server" src="~/Drawing/Codeimgs.aspx" style="cursor: hand"
                                    width="77" height="24" onclick="javascript:ChangeCodeImg('ImageCheckAdmin');"
                                    title="点击更换验证码图片!" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" valign="top" class="width">
                                <ShoveWebUI:ShoveConfirmButton ID="btnLogin" Style="cursor: pointer;" runat="server"
                                    Width="76px" Height="28px" CausesValidation="False" CssClass="submit" BorderStyle="None"
                                    OnClick="btnLogin_Click" />
                                <asp:Button ID="btnLogin2" runat="server" Text="登录" OnClick="btnLogin_Click" Style="display: none" />
                                <a href="Home/Room/Login.aspx" target="_blank" class="alipay_quick_small"></a>
                                <div class="clear">
                                </div>
                                <div class="baidu_login">
                                    <a href="UserForgetPassword.aspx">忘记密码</a>
                                    <%--<a
                                        href="Home/Room/TencentLogin.aspx" target="_blank" style="background: url(Images/qq_03.jpg) no-repeat;
                                        display: inline-block; height: 21px; width: 82px; margin-top:3px; display:none;"></a>--%>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" id="tbLogin2" runat="server">
                        <tr align="center">
                            <td colspan="2">
                                <asp:Label ID="lbUserName" runat="server"></asp:Label>
                                <asp:Label ID="lbUserType" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%" align="right">
                                <a href="Home/Room/OnlinePay/Default.aspx" target="_blank">用户充值</a>&nbsp;&nbsp;&nbsp;
                            </td>
                            <td style="width: 50%">
                                &nbsp;&nbsp;&nbsp;<a href="Home/Room/UserEdit.aspx" target="_blank">用户中心</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%" align="right">
                                <a href="Home/Room/AccountDetail.aspx" target="_blank">交易明细</a>&nbsp;&nbsp;&nbsp;
                            </td>
                            <td style="width: 50%">
                                &nbsp;&nbsp;&nbsp;<a href="Lottery/buy.aspx" target="_blank">购彩大厅</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%" align="right">
                                <a href="Help/faq2.aspx" target="_blank">如何购买</a>&nbsp;&nbsp;&nbsp;
                            </td>
                            <td style="width: 50%">
                                &nbsp;&nbsp;&nbsp;<a href="Help/hemai.aspx" target="_blank">如何合买</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <ShoveWebUI:ShoveConfirmButton ID="imgbtnLogout" Style="cursor: hand; color: #000000;"
                                    BackgroupImage="Images/exit.gif" runat="server" Height="34px" Width="160px" CausesValidation="False"
                                    BorderStyle="None" OnClick="imgbtnLogout_Click" />
                            </td>
                        </tr>
                    </table>
                    <div class="btn">
                        <a href="UserReg.aspx" class="regbtn"></a><a href="Help/faq.aspx">新手上路</a><div class="clear">
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="top" style="margin-top: 8px;">
                    <div class="top_left">
                        <div class="news">
                            <div class="title">
                                <h1>
                                    <%=FocusNews%>
                                </h1>
                                <span></span>
                                <div class="clear">
                                </div>
                            </div>
                            <ul class="news_list">
                                <asp:Repeater ID="RepFocusNews" runat="server">
                                    <ItemTemplate>
                                        <li><a href="<%#Eval("Url") %>" target="_blank">
                                            <%#Shove._String.Cut(Eval("Title").ToString(),18)%></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <div class="faqbox">
                        <div class="faq_title">
                        </div>
                        <div class="content">
                            <ul>
                                <li><a href="Help/faq16.aspx" target="_blank">在网上投注有什么优势？</a></li>
                                <li><a href="Help/faq6.aspx" target="_blank">购彩的流程是什么样的？</a><img src="Images/hot.gif" /></li>
                                <li><a href="Help/faq11.aspx" target="_blank">请问发起的合买如何撤销？</a></li>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="faqbox last">
                        <div class="notice_title">
                        </div>
                        <div class="content">
                            <ul>
                                <asp:Repeater ID="RepSiteAffiches" runat="server">
                                    <ItemTemplate>
                                        <li><a href="SiteNews/NewDetail.aspx?SiteId=<%#Eval("ID")%>" target="_blank" title="<%#Eval("Title")%>">
                                            <span>
                                                <%#Shove._String.Cut(Eval("Title").ToString(),15)%></span></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="left_box">
                    <img src="Images/gg.jpg" />
                </div>
                <div class="left_box">
                    <div class="left_top">
                        <h1>
                            双色球</h1>
                    </div>
                    <div class="left_main">
                        <div class="quick_buy">
                            <dt class="icon_ssq">
                                <img src="Home/Room/Images/logo_ssq.gif" /></dt>
                            <dd id="tdLuckNumber" runat="server">
                            </dd>
                            <dd>
                                <span>[ 红球 ]从1-33中选6个不重复的整数</span></dd>
                            <dd>
                                <span>[ 蓝球 ]从1-16中选1个整数</span></dd>
                        </div>
                        <div class="quick_right">
                            <div class="you">
                                <ul>
                                    <li>每注2元，最高奖 1000 万</li>
                                    <li><a href="Lottery/BuySSQ.aspx">[ 发起合买 ]</a><a href="JoinUs/JoinAllBuy.aspx">[ 参与合买
                                        ]</a></li>
                                </ul>
                            </div>
                            <div class="buy_button">
                                <ShoveWebUI:ShoveConfirmButton ID="btn_OK" runat="server" CausesValidation="False"
                                    Text="" OnClientClick="return CreateLogin('btn_OKClick();');" OnClick="btn_OK_Click"
                                    CssClass="btn_send" />
                                <input type="button" value="机选1注" name="Input" class="sel-input" onclick="return GetLuckNumber(<%=LotteryID %>)" />
                                <input type="button" value="清空" name="Input" class="clear-input" onclick="clear_all_ball();" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <p class="shuangseqiu">
                            <span id='currIsuseName'></span><i class="jz_time">截止时间</i> <b><span class="red"
                                id="toCurrIsuseEndTime"></span></b><a href="Lottery/BuySSQ.aspx" target="_blank">进入专区&gt;&gt;</a>
                            <em>当前奖池奖金：2亿4489万 可开出48注500万大奖</em>
                        </p>
                    </div>
                </div>
                <div class="left_box">
                    <div class="left_top_zc">
                        <h1>
                            高频彩</h1>
                        <ul class="zc_tab_ul">
                            <%-- <li class="zc_tab zc_curtab" id="zc_tab_sfr9" name="sfr9" onclick='clickPlayType("2")'>
                                时时彩</li>--%>
                            <li class="zc_tab" id="zc_tab_bqc" name="bqc" onclick='clickPlayType("3")'>时时乐</li>
                            <li class="zc_tab" id="zc_tab_sfc" name="sfc" onclick='clickPlayType("1")'>11选5</li>
                        </ul>
                    </div>
                    <div id="and5">
                        <div id="i_zc_sfc" class="i_zc_container">
                            <div class="left_main">
                                <iframe id="iframe_playtypes" name="iframe_playtypes" frameborder="0" scrolling="no"
                                    src="Lottery/Index/BuySSL.aspx" onload="document.getElementById('iframe_playtypes').style.height=iframe_playtypes.document.body.scrollHeight;">
                                </iframe>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="left_box">
                    <div class="left_top" style="position: relative; z-index: 1;">
                        <h1>
                            合买推荐</h1>
                        <div class="syn_menu">
                            <ul id="Listli2">
                                <li id="syndicate_tab_hot" name="hot" class="on" onclick="JoinBuyList('inner_syndicate_table_hot','inner_syndicate_table_large','inner_syndicate_table_sports','syndicate_tab_hot')">
                                    热门合买</li>
                                <li id="syndicate_tab_large" name="large" class="" onclick="JoinBuyList('inner_syndicate_table_large','inner_syndicate_table_hot','inner_syndicate_table_sports','syndicate_tab_large')">
                                    大额合买</li>
                                <li id="syndicate_tab_sports" name="sports" class="" onclick="JoinBuyList('inner_syndicate_table_sports','inner_syndicate_table_large','inner_syndicate_table_hot','syndicate_tab_sports')">
                                    足彩合买</li>
                            </ul>
                        </div>
                        <div class="more">
                            <a href="JoinUs/JoinAllBuy.aspx">更多合买&gt;&gt;</a>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="left_main">
                        <table class="hmlist" cellpadding="0" cellspacing="0" border="0" id="inner_syndicate_table_hot">
                            <tbody>
                                <tr class="title">
                                    <td width="115">
                                        彩种
                                    </td>
                                    <td width="135">
                                        发起人
                                    </td>
                                    <td width="60">
                                        战绩
                                    </td>
                                    <td width="90">
                                        方案标题
                                    </td>
                                    <td width="75">
                                        总金额
                                    </td>
                                    <td width="95">
                                        进度+剩余
                                    </td>
                                    <td width="70">
                                        每份金额
                                    </td>
                                    <td width="69">
                                        输入份数
                                    </td>
                                    <td width="45">
                                        购买
                                    </td>
                                </tr>
                                <asp:Repeater ID="RepJoinBuy" runat="server" OnItemCommand="RepJoinBuy_ItemCommand">
                                    <ItemTemplate>
                                        <tr class="">
                                            <td>
                                                <%#Eval("LotteryName")%>
                                            </td>
                                            <td>
                                                <%#Eval("InitiateName")%><img src="Images/icon/luck_3.gif">
                                            </td>
                                            <td>
                                                <%#Eval("Level")%>
                                            </td>
                                            <td class="detail">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),5)%>
                                            </td>
                                            <td>
                                                ￥<%#Eval("Money")%>
                                            </td>
                                            <td class="process">
                                                <%#Eval("Schedule")%>+<%#Eval("ResShare")%>（份）
                                            </td>
                                            <td>
                                                <asp:Label ID="ShareMoney" runat="server" Text='<%#Eval("ShareMoney")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbShare" runat="server" onkeypress="return InputMask_Number();"
                                                    class="text" oncontextmenu="return false" Text="1"></asp:TextBox>
                                                <asp:HiddenField ID="ResShare" runat="server" Value='<%#Eval("ResShare")%>' />
                                                <asp:HiddenField ID="SchememId" runat="server" Value='<%#Eval("ID")%>' />
                                                <asp:HiddenField ID="EndTime" runat="server" Value='<%#Eval("EndTime")%>' />
                                                <asp:HiddenField ID="IsuseID" runat="server" Value='<%#Eval("IsuseID")%>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnBuy" class="buy" runat="server" Text="购买" CommandName="Buy"
                                                    OnClientClick="return CreateLogin();"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr class="bgcolor">
                                            <td>
                                                <%#Eval("LotteryName")%>
                                            </td>
                                            <td>
                                                <%#Eval("InitiateName")%><img src="Images/icon/luck_3.gif">
                                            </td>
                                            <td>
                                                <%#Eval("Level")%>
                                            </td>
                                            <td class="detail">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),5)%>
                                            </td>
                                            <td>
                                                ￥<%#Eval("Money")%>
                                            </td>
                                            <td class="process">
                                                <%#Eval("Schedule")%>+<%#Eval("ResShare")%>（份）
                                            </td>
                                            <td>
                                                <asp:Label ID="ShareMoney" runat="server" Text='<%#Eval("ShareMoney")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbShare" runat="server" onkeypress="return InputMask_Number();"
                                                    class="text" oncontextmenu="return false" Text="1"></asp:TextBox>
                                                <asp:HiddenField ID="ResShare" runat="server" Value='<%#Eval("ResShare")%>' />
                                                <asp:HiddenField ID="SchememId" runat="server" Value='<%#Eval("ID")%>' />
                                                <asp:HiddenField ID="EndTime" runat="server" Value='<%#Eval("EndTime")%>' />
                                                <asp:HiddenField ID="IsuseID" runat="server" Value='<%#Eval("IsuseID")%>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnBuy" class="buy" runat="server" Text="购买" CommandName="Buy"
                                                    OnClientClick="return CreateLogin();"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <table class="hmlist" cellpadding="0" cellspacing="0" border="0" id="inner_syndicate_table_large"
                            style="display: none;">
                            <tbody>
                                <tr class="title">
                                    <td width="115">
                                        彩种
                                    </td>
                                    <td width="135">
                                        发起人
                                    </td>
                                    <td width="60">
                                        战绩
                                    </td>
                                    <td width="90">
                                        方案标题
                                    </td>
                                    <td width="75">
                                        总金额
                                    </td>
                                    <td width="95">
                                        进度+剩余
                                    </td>
                                    <td width="70">
                                        每份金额
                                    </td>
                                    <td width="69">
                                        输入份数
                                    </td>
                                    <td width="45">
                                        购买
                                    </td>
                                </tr>
                                <asp:Repeater ID="RepBigJoinBuy" runat="server" OnItemCommand="RepBigJoinBuy_ItemCommand">
                                    <ItemTemplate>
                                        <tr class="">
                                            <td>
                                                <%#Eval("LotteryName")%>
                                            </td>
                                            <td>
                                                <%#Eval("InitiateName")%><img src="Images/icon/luck_3.gif">
                                            </td>
                                            <td>
                                                <%#Eval("Level")%>
                                            </td>
                                            <td class="detail">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),5)%>
                                            </td>
                                            <td>
                                                ￥<%#Eval("Money")%>
                                            </td>
                                            <td class="process">
                                                <%#Eval("Schedule")%>+<%#Eval("ResShare")%>（份）
                                            </td>
                                            <td>
                                                <asp:Label ID="ShareMoney" runat="server" Text='<%#Eval("ShareMoney")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbShare" runat="server" onkeypress="return InputMask_Number();"
                                                    class="text" oncontextmenu="return false" Text="1"></asp:TextBox>
                                                <asp:HiddenField ID="ResShare" runat="server" Value='<%#Eval("ResShare")%>' />
                                                <asp:HiddenField ID="SchememId" runat="server" Value='<%#Eval("ID")%>' />
                                                <asp:HiddenField ID="EndTime" runat="server" Value='<%#Eval("EndTime")%>' />
                                                <asp:HiddenField ID="IsuseID" runat="server" Value='<%#Eval("IsuseID")%>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnBuy" class="buy" runat="server" Text="购买" CommandName="Buy"
                                                    OnClientClick="return CreateLogin();"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr class="bgcolor">
                                            <td>
                                                <%#Eval("LotteryName")%>
                                            </td>
                                            <td>
                                                <%#Eval("InitiateName")%><img src="Images/icon/luck_3.gif">
                                            </td>
                                            <td>
                                                <%#Eval("Level")%>
                                            </td>
                                            <td class="detail">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),5)%>
                                            </td>
                                            <td>
                                                ￥<%#Eval("Money")%>
                                            </td>
                                            <td class="process">
                                                <%#Eval("Schedule")%>+<%#Eval("ResShare")%>（份）
                                            </td>
                                            <td>
                                                <asp:Label ID="ShareMoney" runat="server" Text='<%#Eval("ShareMoney")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbShare" runat="server" onkeypress="return InputMask_Number();"
                                                    class="text" oncontextmenu="return false" Text="1"></asp:TextBox>
                                                <asp:HiddenField ID="ResShare" runat="server" Value='<%#Eval("ResShare")%>' />
                                                <asp:HiddenField ID="SchememId" runat="server" Value='<%#Eval("ID")%>' />
                                                <asp:HiddenField ID="EndTime" runat="server" Value='<%#Eval("EndTime")%>' />
                                                <asp:HiddenField ID="IsuseID" runat="server" Value='<%#Eval("IsuseID")%>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnBuy" class="buy" runat="server" Text="购买" CommandName="Buy"
                                                    OnClientClick="return CreateLogin();"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <table class="hmlist" cellpadding="0" cellspacing="0" border="0" id="inner_syndicate_table_sports"
                            style="display: none;">
                            <tbody>
                                <tr class="title">
                                    <td width="115">
                                        彩种
                                    </td>
                                    <td width="135">
                                        发起人
                                    </td>
                                    <td width="60">
                                        战绩
                                    </td>
                                    <td width="90">
                                        方案标题
                                    </td>
                                    <td width="75">
                                        总金额
                                    </td>
                                    <td width="95">
                                        进度+剩余
                                    </td>
                                    <td width="70">
                                        每份金额
                                    </td>
                                    <td width="69">
                                        输入份数
                                    </td>
                                    <td width="45">
                                        购买
                                    </td>
                                </tr>
                                <asp:Repeater ID="RepFootBallJoinBuy" runat="server" OnItemCommand="RepFootBallJoinBuy_ItemCommand">
                                    <ItemTemplate>
                                        <tr class="">
                                            <td>
                                                <%#Eval("LotteryName")%>
                                            </td>
                                            <td>
                                                <%#Eval("InitiateName")%><img src="Images/icon/luck_3.gif">
                                            </td>
                                            <td>
                                                <%#Eval("Level")%>
                                            </td>
                                            <td class="detail">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),5)%>
                                            </td>
                                            <td>
                                                ￥<%#Eval("Money")%>
                                            </td>
                                            <td class="process">
                                                <%#Eval("Schedule")%>+<%#Eval("ResShare")%>（份）
                                            </td>
                                            <td>
                                                <asp:Label ID="ShareMoney" runat="server" Text='<%#Eval("ShareMoney")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbShare" runat="server" onkeypress="return InputMask_Number();"
                                                    class="text" oncontextmenu="return false" Text="1"></asp:TextBox>
                                                <asp:HiddenField ID="ResShare" runat="server" Value='<%#Eval("ResShare")%>' />
                                                <asp:HiddenField ID="SchememId" runat="server" Value='<%#Eval("ID")%>' />
                                                <asp:HiddenField ID="EndTime" runat="server" Value='<%#Eval("EndTime")%>' />
                                                <asp:HiddenField ID="IsuseID" runat="server" Value='<%#Eval("IsuseID")%>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnBuy" class="buy" runat="server" Text="购买" CommandName="Buy"
                                                    OnClientClick="return CreateLogin();"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr class="bgcolor">
                                            <td>
                                                <%#Eval("LotteryName")%>
                                            </td>
                                            <td>
                                                <%#Eval("InitiateName")%><img src="Images/icon/luck_3.gif">
                                            </td>
                                            <td>
                                                <%#Eval("Level")%>
                                            </td>
                                            <td class="detail">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),5)%>
                                            </td>
                                            <td>
                                                ￥<%#Eval("Money")%>
                                            </td>
                                            <td class="process">
                                                <%#Eval("Schedule")%>+<%#Eval("ResShare")%>（份）
                                            </td>
                                            <td>
                                                <asp:Label ID="ShareMoney" runat="server" Text='<%#Eval("ShareMoney")%>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbShare" runat="server" onkeypress="return InputMask_Number();"
                                                    class="text" oncontextmenu="return false" Text="1"></asp:TextBox>
                                                <asp:HiddenField ID="ResShare" runat="server" Value='<%#Eval("ResShare")%>' />
                                                <asp:HiddenField ID="SchememId" runat="server" Value='<%#Eval("ID")%>' />
                                                <asp:HiddenField ID="EndTime" runat="server" Value='<%#Eval("EndTime")%>' />
                                                <asp:HiddenField ID="IsuseID" runat="server" Value='<%#Eval("IsuseID")%>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnBuy" class="buy" runat="server" Text="购买" CommandName="Buy"
                                                    OnClientClick="return CreateLogin();"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="left_box">
                    <div class="left_top">
                        <h1>
                            彩票资讯</h1>
                        <span class="more"><a href="SiteNews/News.aspx">更多资讯&gt;&gt;</a></span></div>
                    <div class="left_main">
                        <div class="news_box news_line">
                            <div class="news_acl">
                                <ul class="acl_list">
                                    <asp:Repeater ID="RepFuCai" runat="server">
                                        <ItemTemplate>
                                            <li><a href="SiteNews/NewDetail.aspx?id=<%#Eval("ID")%>" title="<%#Eval("Title") %>">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),23)%></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <div class="news_box">
                            <div class="news_acl">
                                <ul class="acl_list">
                                    <asp:Repeater ID="RepTiCai" runat="server">
                                        <ItemTemplate>
                                            <li><a href="SiteNews/NewDetail.aspx?id=<%#Eval("ID")%>" title="<%#Eval("Title") %>">
                                                <%#Shove._String.Cut(Eval("Title").ToString(),23)%></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="clear nospace">
        </div>
        <uc2:WebFoot ID="WebFoot1" runat="server" />

        <script type="text/javascript">
         setTimeout("Page_load(<%= LotteryID %>);",500);
         GetLuckNumber(<%=LotteryID %>);
        </script>
    </form>
</body>
</html>

<script type="text/javascript">
   var notIE = -[1,];
         if(-[1,]){ 
           alert('尊敬的用户您好，由于您当前使用浏览器不支持网银操作，为了更好地体验购彩服务，请使用以IE为核心的浏览器(例如:IE7.0以上浏览器、360浏览器、傲游浏览器、TT浏览器，TheWorld、Avant Browser 、GreenBrowser.)');
         }
</script>

