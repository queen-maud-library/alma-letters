<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="counter" select="0"/>
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:template name="id-info">
    <xsl:param name="line"/>
    <xsl:variable name="first" select="substring-before($line,'//')"/>
    <xsl:variable name="rest" select="substring-after($line,'//')"/>
    <xsl:if test="$first = '' and $rest = '' ">
      <!--br/-->
    </xsl:if>
    <xsl:if test="$rest != ''">
      <xsl:value-of select="$rest"/>
      <br/>
    </xsl:if>
    <xsl:if test="$rest = ''">
      <xsl:value-of select="$line"/>
      <br/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="id-info-hdr">
    <xsl:call-template name="id-info">
      <xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
      <xsl:with-param name="label" select="'Bibliographic Information:'"/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="/">
    <xsl:variable name="info" select="notification_data/partner_shipping_info_list/partner_shipping_info[1]" />
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" />
        <!-- header.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table border="0" cellpadding="5" cellspacing="0">
              <tr>
                <td valign="top">@@supplied_to@@:</td>
                <td>
                  <div>
                    <xsl:value-of select="notification_data/partner_name"/> (
                                                                                                                                    
                    <xsl:value-of select="notification_data/email"/> /                                                                                                                                     
                    <xsl:value-of select="notification_data/phone"/>)
                                                                                                                      
                  </div>
                  <br />
                  <div>
                    <table>
                      <tr>
                        <td>
                          <xsl:if test="$info/address1 != ''">
                            <div>
                              <xsl:value-of select="$info/address1"/>
                            </div>
                          </xsl:if>
                          <xsl:if test="$info/address2 != ''">
                            <div>
                              <xsl:value-of select="$info/address2"/>
                            </div>
                          </xsl:if>
                          <xsl:if test="$info/address4 != ''">
                            <div>
                              <xsl:value-of select="$info/address4"/>
                            </div>
                          </xsl:if>
                          <xsl:if test="$info/address5 != ''">
                            <div>
                              <xsl:value-of select="$info/address5"/>
                            </div>
                          </xsl:if>
                          <div>
                            <xsl:value-of select="$info/postal_code"/>
                            <xsl:value-of select="$info/city"/>
                          </div>
                          <div>
                            <xsl:value-of select="$info/state"/>
                            <xsl:value-of select="$info/country"/>
                          </div>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <br />
                </td>
              </tr>
              <tr>
                <td>Library number:</td>
                <td>
                  <xsl:value-of select="substring(notification_data/partner_code, 4, 3)"/>&#160;&#160;
                                                      
                  <xsl:value-of select="substring(notification_data/partner_code, 7)"/>
                </td>
              </tr>
              <tr>
                <td>@@borrower_reference@@:</td>
                <td>
                  <xsl:call-template name="id-info-hdr"/>
                </td>
              </tr>
              <tr>
                <td>@@format@@:</td>
                <td>
                  <xsl:value-of select="notification_data/incoming_request/format"/>
                </td>
              </tr>
              <xsl:if test="notification_data/incoming_request/needed_by != ''">
                <tr>
                  <td>@@date_needed_by@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/incoming_request/needed_by"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/incoming_request/note != ''">
                <tr>
                  <td>@@request_note@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/incoming_request/note"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/incoming_request/create_date_str != ''">
                <tr>
                  <td>Request created:</td>
                  <td>
                    <xsl:value-of select="notification_data/incoming_request/create_date_str" />
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/item/barcode != ''">
                <tr>
                  <td>@@item_barcode@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/item/barcode"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/incoming_request/item_sent_date != ''">
                <tr>
                  <td>Item sent:</td>
                  <td>
                    <xsl:value-of select="notification_data/incoming_request/item_sent_date" />
                  &#160;from&#160;
                                                                                                          
                    <xsl:choose>
                      <!-- Physical items -->
                      <xsl:when test="notification_data/item/library_name != ''">
                        <xsl:value-of select="notification_data/item/library_name"/>&#160;
                                                                                                                                           
                        <xsl:value-of select="notification_data/item/location_name"/>
                      </xsl:when>
                      <!-- Articles, etc. (non-returnable, digital) -->
                      <xsl:otherwise>
                        <xsl:value-of select="notification_data/organization_unit/name"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td valign="top">Metadata:</td>
                <td>
                  <table border="0" cellpadding="5" cellspacing="0">
                    <xsl:if test="notification_data/metadata/material_type != ''">
                      <tr>
                        <td align="right">
                          <em>Type:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/material_type"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/title != ''">
                      <tr>
                        <td align="right">
                          <em>Title:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/title"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/chapter != ''">
                      <tr>
                        <td align="right">
                          <em>Chapter:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/chapter"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/author != ''">
                      <tr>
                        <td align="right">
                          <em>Author:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/author"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/journal_title != ''">
                      <tr>
                        <td align="right">
                          <em>Journal:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/journal_title"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/volume != ''">
                      <tr>
                        <td align="right">
                          <em>Vol.:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/volume"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/issue != ''">
                      <tr>
                        <td align="right">
                          <em>Issue:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/issue"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/start_page != ''">
                      <tr>
                        <td align="right">
                          <em>Start page:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/start_page"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/pages != ''">
                      <tr>
                        <td align="right">
                          <em>Pages:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/pages"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/metadata/publication_date != ''">
                      <tr>
                        <td align="right">
                          <em>Date:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/metadata/publication_date"/>
                        </td>
                      </tr>
                    </xsl:if>
                  </table>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <br />
        <br />
        <xsl:call-template name="lastFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
