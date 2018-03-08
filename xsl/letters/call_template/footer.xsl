<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="salutation"></xsl:template>

  <xsl:template name="lastFooter">
    <table width="100%">
      <tr>
        <td><h2><xsl:value-of select="notification_data/organization_unit/name" /></h2></td>
      </tr>
      <tr>
        <td>
          Send svar til (Reply to):&#160;
          <u>
          <xsl:choose>
            <xsl:when test="notification_data/organization_unit/email/email != ''">
              <xsl:value-of select="notification_data/organization_unit/email/email" />
            </xsl:when>
            <xsl:when test="notification_data/item/owning_library_details/email != ''">
              <xsl:value-of select="notification_data/item/owning_library_details/email" />
            </xsl:when>
            <xsl:otherwise>
              bibliotek@dmmh.no
            </xsl:otherwise>
          </xsl:choose>
          </u>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template name="contactUs">
    <table align="left">
      <tr>
        <td align="left">
          <a><xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>@@contact_us@@</a>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template name="myAccount">
    <table align="right">
      <tr>
        <td align="right">
          <a><xsl:attribute name="href">@@email_my_account@@</xsl:attribute>@@my_account@@</a>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>