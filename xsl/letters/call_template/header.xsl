<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Heading without logo for internal letters -->
  <xsl:template name="head">
    <xsl:variable name="data" select="notification_data/general_data" />
    <div>
      <table width="100%">
        <tr>
          <td>
            <h2><xsl:value-of select="$data/letter_name"/></h2>
          </td>
          <td align="right" valign="top" width="45%">
            <h2><xsl:value-of select="$data/current_date" /></h2>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
</xsl:stylesheet>