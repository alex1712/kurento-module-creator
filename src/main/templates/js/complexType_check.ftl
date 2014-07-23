<#include "macros.ftm" >
<#assign module_name=model.name>
<#assign module_namespace>
  <#lt>${module_name}/complexTypes<#rt>
</#assign>
complexTypes/${complexType.name}.js
/* Autogenerated with Kurento Idl */

<#include "license.ftm" >

var checkType = require('checktype');

/**
 * Media API for the Kurento Web SDK
 *
 * @module ${module_namespace}
 *
 * @copyright 2014 Kurento (http://kurento.org/)
 * @license LGPL
 */

/**
 * Checker for {@link ${module_namespace}.${complexType.name}}
 *
 * @param {String} key
 * @param {${module_namespace}.${complexType.name}} value
 */
function check${complexType.name}(key, value)
{
<#switch complexType.typeFormat>
  <#case "ENUM">
  if(typeof value != 'string')
    throw SyntaxError(key+' param should be a String, not '+typeof value);
  if(!value.match('<@join sequence=complexType.values separator="|"/>'))
    throw SyntaxError(key+' param is not one of [<@join sequence=complexType.values separator="|"/>] ('+value+')');
  <#break>
  <#case "REGISTER">
    <#list complexType.properties as property>
  checkType('${property.type.name}', key+'.${property.name}', value.${property.name}${property.optional?string("", ", true")});
    </#list>
  <#break>
</#switch>
};


/**
<#if complexType.doc??>
  <#list complexType.doc?split("\n") as line>
 * ${sphinxLinks(line)}
  </#list>
 *
</#if>
 * @typedef ${module_namespace}.${complexType.name}
 *
<#switch complexType.typeFormat>
  <#case "ENUM">
 * @type {(<@join sequence=complexType.values separator="|"/>)}
  <#break>
  <#case "REGISTER">
 * @type {Object}
    <#list complexType.properties as property>
 * @property {${property.type.name}} ${property.name}
      <#if property.doc??>
        <#list property.doc?split("\n") as line>
 *  ${sphinxLinks(line)}
        </#list>
      </#if>
    </#list>
  <#break>
</#switch>
 */


module.exports = check${complexType.name};
