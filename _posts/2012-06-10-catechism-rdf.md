---
layout: post
title: Catechism RDF
author: rjzaar
nid: 430
created: 1339298382
---
<div id="oc-wiki-content" class="oc-wiki-content">
<div>
<div class="documentDescription">Catechism RDF (Resource Description Framework) is a far deeper and more complex machine readable version of the Catechism. It does not just express where words are but how those words are linked. What the semantic linking of each word in the Catechism is. This would require work on the English, French and Latin versions. Once complete, this text would form a basis for natural language processing tools to be able to process other theological texts far more accurately and usefully.</div>
<div class="visualClear">&nbsp;</div>
<div class="viewlet defaultPortletWrapper cccrdf" style="margin: 0pt 0px 4px;"><dl class="portlet"><dt class="portletHeader"><span class="portletTopLeft"></span> <span>Catechism RDF</span> <span class="portletTopRight"></span></dt><dd class="portletItem">
<div class="plain" style="position: static;">

Catechism RDF is a key component of the Catholic Semantic Web. The world wide web consortium is leading the web into the Semantic web.
"The Semantic Web is an extension of the current Web in which information is given well-defined meaning, enabling computers and people to work in better cooperation. The Web will reach its full potential when it becomes an environment where data can be shared and processed by automated tools as well as by people." - Tim Berners-Lee and Eric Miller

The automated tools mentioned by Tim and Eric have a level of AI, where they can process human text. A&nbsp; quick look through the following links will alert the reader to the potential and importance of such tools

<span class="link-external"><a href="http://en.wikipedia.org/wiki/Natural_language_processing">Natural Language Processing at Wikipedia:</a></span> <strong>Natural language processing (NLP)</strong> is a subfield of <span class="link-external"><a title="Artificial intelligence" href="http://en.wikipedia.org/wiki/Artificial_intelligence">artificial intelligence</a></span> and <span class="link-external"><a title="Linguistics" href="http://en.wikipedia.org/wiki/Linguistics">linguistics</a></span>. It studies the problems of automated generation and understanding of <span class="link-external"><a title="Natural language" href="http://en.wikipedia.org/wiki/Natural_language">natural human languages</a></span>. Natural language generation systems convert information from computer databases into normal-sounding human language, and natural language understanding systems convert samples of human language into more formal representations that are easier for computer programs to manipulate.
<span class="link-external"><a href="http://research.microsoft.com/nlp/">
Natural Language Processing at Microsoft:</a></span> The goal of the Natural Language Processing (NLP) group is to design and build software that will analyze, understand, and generate languages that humans use naturally, so that eventually you will be able to address your computer as though you were addressing another person.

<span class="link-external"><a href="http://www.aaai.org/AITopics/html/natlang.html">Natural Language Processing at American Association for Artificial Intelligence</a></span>: The value to our society of being able to communicate with computers in everyday "natural" language cannot be overstated. Imagine asking your computer "Does this candidate have a good record on the environment?" or "When is the next televised National League baseball game?" Or being able to tell your PC "Please format my homework the way my English professor likes it." Commercial products can already do some of these things, and AI scientists expect many more in the next decade. One goal of AI work in natural language is to enable communication between people and computers without resorting to memorization of complex commands and procedures. Automatic translation---enabling scientists, business people and just plain folks to interact easily with people around the world---is another goal. Both are just part of the broad field of AI and natural language, along with the cognitive science aspect of using computers to study how humans understand language.

Is it possible to talk theologically with a computer? Yes, but not yet. The tools to perform such a function are already being developed as you can see by following the above links. What is needed is for them to know Catholic Theology. What is needed is Catechism RDF.

Catechism RDF

XML ( eXtensible Markup Language) describes what something is, eg Fr. John is a Priest (&lt;priest&gt;Fr. John&lt;/priest&gt;). RDF descibes the relationship between words, eg Fr. John is the Parish priest of St. John's. It would look something like:

<pre>&lt;?xml version="1.0"?&gt;
&lt;rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
             xmlns:catholic="http://vatican.va/ns/catholic#"&gt;

  &lt;catholic:Person rdf:about="http://melbourne.catholic.org.au/People/JohnSmith/"&gt;
    &lt;catholic:fullName&gt;John Smith&lt;/catholic:fullName&gt;
    &lt;catholic:religious&gt;priest&lt;/catholic:religious&gt;
    &lt;catholic:parish&gt;St. John's&lt;/catholic:parish&gt;
  &lt;/catholic:Person&gt;

&lt;/rdf:RDF&gt;</pre>

It is clear that in this instance, we have a simple and clear meaning for each of these words. When it comes to a document like the catechism, there are far more complexities.
Words can have more than one meaning, eg 'The invalid had an invalid ticket'. Words translated from one language will have different meanings in another, eg the Greek word 'anouthen' (Jn 3:3) normally translated 'again', also can mean 'from above'. So there is a loss of meaning when translated from one translation to another. Then there is the decision of which meaning is intended in a particular circumstance. St. John may have intended both, thus different translations focus on different meanings. These are just some of the issues with converting a text into a computer readable format.

The Catholic Catechism is in three important languages, French (which was the draft text), Latin (which is an official text) and English which is the text used in the English speaking world. Catechism RDF will need to take into account the matrix of meanings as well as the different sentence structures.

STEPS NEEDED

The standards provided by w3c.org for RDF and OWL provide a starting point. Ultimately the Catechism RDF will be expressed in that format.
A common markup of the Catechism using a particular tag set will need to be completed on each language version. This is a project in an off itself. Each markup up text can then be expressed in a RDF and then OWL.</div>
</dd></dl></div>
</div>
</div>
