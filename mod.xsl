<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.alipay-form">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-alipay-form" ox-mod="alipay-form">
            <div class="auto-wrapper">
                
                <div id="tip" style="color:#f60;text-align:right;display:none;">
                </div>
                <div class="orderwrap">
                    <h3>
                        订单信息
                    </h3>
                    <table class="order-info" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr>
                                <th>商品</th>
                                <td>
                                    <xsl:value-of select="data/order/title"/>
                                </td>
                            </tr>
                            <tr>
                                <th>金额</th>
                                <td>
                                    <b class="price">
                                        <xsl:value-of select="format-number(data/order/totalfee, '0.00')"/>
                                    </b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="wxpaybox">
                    <div class="alipay">
                        <br/>
                        <img width="75" alt="　"
                             src="http://i.oxm1.cc/uploads/git/wurui/img/2ag7uubwmTj34i79t6Rl9ypA4le-940.png"/>
                    </div>

                    <xsl:choose>
                        <xsl:when test="data/alipayform/service !='' ">
                            <div id="bottomtip">
                                正在跳转支付宝收银台...
                            </div>

                            <form name="payform" action="https://mapi.alipay.com/gateway.do" type="get">

                                <xsl:for-each select="data/alipayform/*">
                                    <input type="hidden" name="{name(.)}" value="{.}"/>
                                </xsl:for-each>
                                <button>提交</button>
                            </form>
                            <script><![CDATA[
                                        if(/QQ/.test(navigator.userAgent)){
                                            var paytip=document.getElementById('tip');
                                            var isIOS=/iphone|ipad|ios/i.test(navigator.userAgent)
                                            paytip.style.display="block";
                                            paytip.innerHTML='请点击上方菜单选择用'+(isIOS?'Safari':'浏览器')+'打开完成付款<big style="display:inline-block;transform:rotate(-90deg)">&#8627;</big>&#160;&#160;&#160;&#160;'
                                            document.getElementById('bottomtip').innerHTML='付款完成后请回到本页面<br/><a href="https://m.shaomachetie.com/smct-order">查看订单</a>'
                                        }else{
                                           // document.forms.payform.submit();
                                        }
                                        ]]>
                            </script>
                        </xsl:when>
                        <xsl:otherwise>
                            <h3 class="error">
                                无法支付!
                                <br/>商家未开通支付宝
                            </h3>
                        </xsl:otherwise>
                    </xsl:choose>

                </div>


            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
