<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/">
  <html>
<style>

  .odd{
  background-color:#F0FFFF;
  }

  body{

  text-align: center;
  margin-left: auto;
  margin-right: auto;
  position:relative;
  }

  table{
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  }

  #logo{
  width: 500px;
  }

  #autor{
  right:175;
  position:relative;
  top:200;
  }

  #fakulta{
  position:relative;

  }




  #uvod{
height:1000;

  width:800;
  display: inline-block;
  border:1px solid black;
  }

  #nazev_prace{
  position:relative;
  top:100;

  }

  #datum{
  position:relative;
  top:200;
  }

  #popis_prace{


  top:200;


  }

#popis_prace{

border:1px;
  display: inline-block;


  bottom100;

  }


</style>


  <body >


    <div id="uvod">
      <h1><xsl:value-of select="bakalarska_prace/informace/tema_prace"/></h1>
   <h2 id="fakulta"> <xsl:value-of select="bakalarska_prace/informace/nazev_skoly"/>, <xsl:value-of select="bakalarska_prace/informace/fakulta"/> Obor : <xsl:value-of select="bakalarska_prace/@obor"/></h2>
    <img id="logo" src="czuLogo.gif"/>
      <h1 id="nazev_prace"> <xsl:value-of select="bakalarska_prace/informace/jmeno_prace"/> / <xsl:value-of select="bakalarska_prace/informace/realne_tema_prace"/></h1>
      <span id = "datum">Datum Vypracování : <xsl:value-of select="bakalarska_prace/informace/den"/>,<xsl:value-of select="bakalarska_prace/informace/mesic"/>,<xsl:value-of select="bakalarska_prace/informace/rok"/>  </span>
    <h2 id="autor">Jméno : <xsl:value-of select="bakalarska_prace/@autor"/> </h2>
      <span id="popis_prace"><strong>Popis práce: </strong>  <xsl:value-of select="bakalarska_prace/informace/popis_prace"/> </span>
    </div>

    <div>
<h3>Seznam metodik</h3>
  <table border="2" bgcolor="silver" color="white">
    <tr bgcolor="#9acd32">
      <th>Název</th>
      <th>Metodika</th>
      <th>Zaměření</th>
      <th>Autor</th>
      <th>Rok</th>

    </tr>

    <xsl:for-each select="bakalarska_prace/metodiky/metodika">
    <tr class="odd">
      <td><xsl:value-of select="nazev"/></td>
      <td><xsl:value-of select="@typ"/></td>
      <td><xsl:value-of select="zamereni"/></td>
      <td><xsl:value-of select="autor"/></td>
      <td><xsl:value-of select="rok"/></td>


    </tr>
    </xsl:for-each>

  </table>
    </div>

    <h3>Agilní metodiky</h3>
    <table border="2">
      <tr bgcolor="#9acd32">
        <th>Nazev</th>
        <th>Autor</th>
        <th>Rok</th>
        <th>Výhoda</th>
        <th>Nevyhoda</th>
        <th>pouziti</th>
        <th>Délka sprintů</th>
        <th>Tvoření dokumentace</th>
         <th>Hodnocení</th>
      </tr>

      <xsl:for-each select="bakalarska_prace/metodiky/metodika[@typ='agilni']">
        <tr class="odd">
          <td><xsl:value-of select="nazev/@plny_nazev"/></td>
          <td><xsl:value-of select="autor"/></td>
          <td><xsl:value-of select="rok"/></td>
          <td><xsl:value-of select="vyhoda"/></td>
          <td><xsl:value-of select="nevyhoda"/></td>
          <td><xsl:value-of select="pouziti"/></td>
          <td><xsl:value-of select="delka_sprintu"/></td>
          <td><xsl:value-of select="dokumentace"/></td>
          <td><xsl:value-of select="score"/></td>

        </tr>
      </xsl:for-each>
    </table>
    <span>Hodnocení Agilních systémů :<xsl:value-of select="sum(bakalarska_prace/metodiky/metodika[@typ='agilni']/score/@hodnota)"/></span>




    <h3>Strukturované metodiky</h3>
    <table border="2">
      <tr bgcolor="#9acd32">
        <th>Nazev</th>
        <th>Autor</th>
        <th>Rok</th>
        <th>Výhoda</th>
        <th>Nevyhoda</th>
        <th>pouziti</th>
        <th>pocet_iteraci</th>
        <th>Délka sprintů</th>
        <th>Tvoření dokumentace</th>
        <th>Hodnocení</th>
      </tr>

      <xsl:for-each select="bakalarska_prace/metodiky/metodika[@typ='strukturovana']">
        <tr class="odd">
          <td><xsl:value-of select="nazev/@plny_nazev"/></td>
          <td><xsl:value-of select="autor"/></td>
          <td><xsl:value-of select="rok"/></td>
          <td><xsl:value-of select="vyhoda"/></td>
          <td><xsl:value-of select="nevyhoda"/></td>
          <td><xsl:value-of select="pouziti"/></td>
          <td><xsl:value-of select="pocet_iteraci"/></td>
          <td><xsl:value-of select="delka_sprintu"/></td>
          <td><xsl:value-of select="dokumentace"/></td>
          <td><xsl:value-of select="score"/></td>

        </tr>
      </xsl:for-each>
    </table>
    <span>Hodnocení Strukturovaných systémů : <xsl:value-of select="sum(bakalarska_prace/metodiky/metodika[@typ='strukturovana']/score/@hodnota)"/></span>

<div>
    <xsl:for-each select="bakalarska_prace/popis_metodik/agilni">
      <article>
        <br><h2><xsl:value-of select="nadpis"/></h2></br>
        <br><strong>Popis </strong><xsl:value-of select="popis"/></br>
        <br><strong>Hlavní výhody jsou :</strong><xsl:value-of select="princip"/></br>
        <br><strong>Hlavní priority jsou </strong><xsl:value-of select="priorita"/></br>
        <br><strong>Styl plánování a implementace </strong><xsl:value-of select="proces"/></br>
        <br><strong>Průměrné náklady na zadevední agilních metodik je: </strong><xsl:value-of select="cena_zavedeni"/> kč</br>
        <br><strong>Styl vedení je : </strong><xsl:value-of select="vedeni"/></br>
        <br><strong>Styl organizace : </strong><xsl:value-of select="organizace"/> kč</br>
        <br><strong>Metodika je vhodná pro </strong><xsl:value-of select="vhodne"/> a nevhodné pro <xsl:value-of select="nevhodne"/></br>
        <br><strong>Lidé ji hodnotí jako </strong><xsl:value-of select="popularita"/></br>
        <br><strong>Byla použitá analíza </strong><xsl:value-of select="popis_analizy"/></br>
        <br><strong>Maximální score pro tuto metodu je </strong><xsl:value-of select="maximalni_score"/> a minimální score je <xsl:value-of select="minimalni_score"/></br>

      </article>
    </xsl:for-each>



  <br><span><xsl:value-of select="bakalarska_prace/popis_metodik/agilni/firmy/vysvetlivka"/></span></br>
    <xsl:for-each select="bakalarska_prace/popis_metodik/agilni/firmy">

      <td><xsl:value-of select="firma[@id='1']"/> </td>
      <td><xsl:value-of select="firma[@id='2']"/> </td>
      <td><xsl:value-of select="firma[@id='3']"/> </td>
      <td><xsl:value-of select="firma[@id='4']"/> </td>
      <td><xsl:value-of select="firma[@id='5']"/> </td>
      <td><xsl:value-of select="firma[@id='6']"/> </td>


    </xsl:for-each>


</div>

    <div >
      <br><span><strong>Použitá literatura </strong></span></br>
      <xsl:for-each select="bakalarska_prace/informace/pouzita_literatura/literatura">
        <br><td><xsl:value-of select="@id"/> -  <xsl:value-of select="odkaz"/> </td></br>
      </xsl:for-each>
    </div>

    <div >
      <br><span><strong>Použité tabulky </strong></span></br>
      <xsl:for-each select="bakalarska_prace/informace/pouzite_tabulky/tabulka">
        <br><td><xsl:value-of select="@id"/> -  <xsl:value-of select="nazev_tabulky"/> </td></br>
      </xsl:for-each>
    </div>

    <div >
    <br><span><strong>Použité obrázky </strong></span></br>
    <xsl:for-each select="bakalarska_prace/informace/pouzite_obrazky/obrazek">
      <br><td><xsl:value-of select="@id"/> -  <xsl:value-of select="nazev_obrazku"/> </td></br>
    </xsl:for-each>
  </div>

    <xsl:value-of select="bakalarska_prace/informace/metaAutor"/> / <xsl:value-of select="bakalarska_prace/informace/metaDatum"/> / <xsl:value-of select="bakalarska_prace/informace/metaNazevPrace"/> / <xsl:value-of select="bakalarska_prace/informace/metaSkupina"/>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>