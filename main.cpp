#include <phpcpp.h>
#include <DiscountCpp/DiscountCpp.hpp>

Php::Value getHTMLFromMarkdownString(Php::Parameters &params) {
  return discountcpp::getHTMLFromMarkdownString(params[0]);
}
Php::Value getHTMLFromMarkdownFile(Php::Parameters &params) {
  return discountcpp::getHTMLFromMarkdownFile(params[0]);
}
void writeHTMLFileFromMarkdownString(Php::Parameters &params) {
  discountcpp::writeHTMLFileFromMarkdownString(params[0],params[1]);
}
void writeHTMLFileFromMarkdownFile(Php::Parameters &params) {
  discountcpp::writeHTMLFileFromMarkdownFile(params[0],params[1]);
}


extern "C" {
    PHPCPP_EXPORT void *get_module()
    {
        static Php::Extension extension("markdown", "0.1");
        extension.add("getHTMLFromMarkdownString", getHTMLFromMarkdownString);
        extension.add("getHTMLFromMarkdownFile", getHTMLFromMarkdownString);
        extension.add("writeHTMLFileFromMarkdownString", getHTMLFromMarkdownString);
        extension.add("writeHTMLFileFromMarkdownFile", getHTMLFromMarkdownString);
        return extension;
    }
}

