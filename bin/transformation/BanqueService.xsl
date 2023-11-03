
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tns="http://www.example.org/ServiceBanque"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
      <!-- Créez une variable pour stocker la somme totale des soldes de tous les comptes -->
  <xsl:variable name="totalSolde">
    <xsl:value-of select="sum(tns:BS/tns:getComptes)" />
  </xsl:variable>

  <!-- Créez une variable pour stocker la somme totale des soldes des comptes créés après 2000 -->
  <xsl:variable name="totalSoldeFiltré">
    <xsl:value-of select="sum(tns:BS/tns:getComptes[xs:date(tns:dateCreation) > xs:date('2000-01-01')]/tns:solde)" />
  </xsl:variable>
    
  <xsl:template match="/">
    <html>
      <head>
        <title>Liste des comptes</title>
      </head>
      <body>
        <h1>Liste des comptes</h1>
        <table border="1">
          <tr>
            <th>Code</th>
            <th>Solde</th>
            <th>Date de Création</th>
          </tr>
          <xsl:for-each select="tns:BS/tns:getComptes">
            <tr>
              <td><xsl:value-of select="tns:code" /></td>
              <td><xsl:value-of select="tns:solde" /></td>
              <td><xsl:value-of select="tns:dateCreation" /></td>
            </tr>
          </xsl:for-each>
        </table>
        <h1>Liste des comptes créés aprés 2000</h1>
        <table border="1">
          <tr>
            <th>Code</th>
            <th>Solde</th>
            <th>Date de Création</th>
          </tr>
          <!-- Parcourez les éléments <tns:getComptes> créés après 2000 -->
          <xsl:for-each select="tns:BS/tns:getComptes[xs:date(tns:dateCreation) > xs:date('2000-01-01')]">
            <tr>
              <td><xsl:value-of select="tns:code" /></td>
              <td><xsl:value-of select="tns:solde" /></td>
              <td><xsl:value-of select="tns:dateCreation" /></td>
            </tr>
          </xsl:for-each>
        </table>
        <!-- Affichez la somme totale des soldes de tous les comptes -->
        <p>Somme totale des soldes de tous les comptes : <xsl:value-of select="$totalSolde" /></p>
        <!-- Affichez la somme totale des soldes créés après 2000 -->
        <p>Somme totale des soldes des comptes filtrés : <xsl:value-of select="$totalSoldeFiltré" /></p>
  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>