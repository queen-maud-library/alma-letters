<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:template match="/">
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
            <table width="100%" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td colspan="2"><h3><xsl:value-of select="notification_data/user_for_printing/name"/></h3></td>
              </tr>
              <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                <tr>
                  <td colspan="2">
                    <b>@@note_item_specified_request@@.</b>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td>@@request_type@@:</td>
                <td>
                  <xsl:value-of select="notification_data/request_type"/>
                </td>
              </tr>
              <xsl:if test="notification_data/request/manual_description != ''">
                <tr>
                  <td>@@please_note@@: @@manual_description_note@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/request/manual_description"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td>@@request_id@@:</td>
                <td>
                  <xsl:value-of select="notification_data/request_id" />
                </td>
              </tr>
              <xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
                <tr>
                  <td>@@item_barcode@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/phys_item_display/available_items/available_item/barcode" />
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td valign="top">Metadata:</td>
                <td>
                  <table width="100%" cellspacing="0" cellpadding="5" border="0">
                    <tr>
                      <td width="25%">
                        <em>Title:</em>
                      </td>
                      <td>
                        <xsl:value-of select="notification_data/phys_item_display/title" />
                      </td>
                    </tr>
                    <xsl:if test="notification_data/phys_item_display/author !=''">
                      <tr>
                        <td width="25%">
                          <em>Author:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/phys_item_display/author"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/phys_item_display/issue_level_description !=''">
                      <tr>
                        <td width="25%">
                          <em>Other info:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/phys_item_display/issue_level_description"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/phys_item_display/isbn != ''">
                      <tr>
                        <td width="25%">
                          <em>@@isbn@@:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/phys_item_display/isbn"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/phys_item_display/issn != ''">
                      <tr>
                        <td width="25%">
                          <em>@@issn@@:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/phys_item_display/issn"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/phys_item_display/edition != ''">
                      <tr>
                        <td width="25%">
                          <em>@@edition@@:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/phys_item_display/edition"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="notification_data/phys_item_display/imprint != ''">
                      <tr>
                        <td width="25%">
                          <em>@@imprint@@:</em>
                        </td>
                        <td>
                          <xsl:value-of select="notification_data/phys_item_display/imprint"/>
                        </td>
                      </tr>
                    </xsl:if>
                  </table>
                </td>
              </tr>
              <xsl:if test="notification_data/user_for_printing/name">
                <tr>
                  <td valign="top">@@requested_for@@:</td>
                  <td>
                    <table cellspacing="0" cellpadding="5" border="0">
                      <tr>
                        <td>
                          <xsl:value-of select="notification_data/user_for_printing/name"/>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <xsl:value-of select="notification_data/user_for_printing/identifiers/code_value/value"/>
                        </td>
                      </tr>
                      <xsl:if test="notification_data/user_for_printing/user_group != ''">
                        <tr>
                          <td>User Group: 
                            <xsl:value-of select="notification_data/user_for_printing/user_group"/>
                          </td>
                        </tr>
                      </xsl:if>
                    </table>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td colspan="2">
                  <br />
                  <br />
                  <br />
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <xsl:call-template name="mainTableStyleCss" />
                      <!-- style.xsl -->
                    </xsl:attribute>
                    <tr>
                      <th>Barcode</th>
                      <th>Call number</th>
                      <th>Location</th>
                    </tr>
                    <xsl:for-each select="notification_data/phys_item_display/available_items/available_item">
                      <tr>
                        <td>
                          <xsl:value-of select="barcode"/>
                        </td>
                        <td>
                          <xsl:value-of select="call_number"/>
                        </td>
                        <td>
                          <xsl:value-of select="location_name"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                  <br />
                  <br />
                </td>
              </tr>
              <xsl:if test="notification_data/external_id != ''">
                <tr>
                  <td>@@external_id@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/external_id"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/system_notes != ''">
                <tr>
                  <td>@@system_notes@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/request/system_notes"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/request/note != ''">
                <tr>
                  <td>@@request_note@@:</td>
                  <td>
                    <xsl:value-of select="notification_data/request/note"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </div>
        </div>
        <xsl:call-template name="lastFooter" />
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
