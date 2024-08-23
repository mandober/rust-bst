## Locale

- [LC_ALL](#lcall)
- [LANG](#lang)
- [LC_COLLATE](#lccollate)
- [LC_CTYPE](#lcctype)
- [LC_TIME](#lctime)
- [LC_NUMERIC](#lcnumeric)
- [LC_MONETARY](#lcmonetary)
- [LC_MESSAGES](#lcmessages)
- [LC_PAPER](#lcpaper)
- [LC_NAME](#lcname)
- [LC_ADDRESS](#lcaddress)
- [LC_TELEPHONE](#lctelephone)
- [LC_MEASUREMENT](#lcmeasurement)
- [LC_IDENTIFICATION](#lcidentification)
- [TZ](#tz)
- [I18NPATH](#i18npath)
- [LOCPATH](#locpath)



### LC_ALL
This variable overrides other unset LC_* variables.

### LANG
The value of LANG environment variable is established at installation. LANG is the normal environment variable for specifying a locale. As a user, you normally set this variable, unless some of the other variables have already been set by the system, in `/etc/profile` or similar initialization files. It is a fallback variable for unset ones.

### LC_COLLATE
This category governs the collation rules used for sorting and regular expressions, including character equivalence classes and multicharacter collating elements governing the behavior of ranges, equivalence classes, and multicharacter collating elements.  
A collation element is the unit of comparison for collation. A collation element may be a character or a sequence of characters. Every collation element in the locale has a set of weights, which determine if the collation element collates before, equal to, or after the other collation elements in the locale. Each collation element is assigned collation weights by the `localedef` command when the locale definition source file is converted. These collation weights are then used by applications programs that compare strings. [more details][1]  
The behavior of shell's (bash) range specificiers within bracket matching expressions in the pattern matcher e.g. `[A-Z]` depends on the current locale, specifically the value of LC_COLLATE. Setting this variable to `C` or `POSIX` will result in the traditional ASCII behavior for range comparisons: `ABC...XYZ...abc...xyz`. If the locale is set to something else, e.g. `en_US` (specified by the `LANG` or `LC_ALL` variables), collation order is locale-dependent. For example, `en_US` sorts letters like this `AaBb...Zz`. So a range specification like `[A-Z]` will match every letter except "z". Other locales collate like: `aAbBcC...zZ`, which means that `[A-Z]` matches every letter except "a". The portable way to specify upper case letters is `[:upper:]` instead of `A-Z`; lower case may be specified as `[:lower:]` instead of "a-z".

### LC_CTYPE
This category determines the interpretation of byte sequences as characters (e.g. single versus multibyte characters), character classifications (e.g. alphabetic or digit), and the behavior of character classes. On glibc systems, this category also determines the character transliteration rules for `iconv(1)` and `iconv(3)`. It changes the behavior of the character handling and classification functions, such as `isupper(3)` and `toupper(3)`.

### LC_TIME
The format of date varies between locales. For example, Christmas day in 1994 is written as 12/25/94 in the USA and as 25/12/94 in Australia; most of Europe uses a 24-hour clock versus the 12-hour clock used in the United States. Further, the nature and yearly extent of the Daylight Saving correction vary widely between countries.

### LC_MESSAGES
This category affects the language in which messages are displayed and what an affirmative or negative answer looks like.

### LC_NUMERIC
This category determines the formatting rules used for nonmonetary numeric values—for example, the thousands separator and the radix character (a period in most English-speaking countries, but a comma in many other regions).

### LC_MONETARY
This category determines the formatting used for monetary-related numeric values.

### LC_PAPER
Change the settings relating to the dimensions of the standard paper size (e.g., US letter versus A4).

### LC_NAME
Change settings that describe the formats used to address persons. 

### LC_ADDRESS
Change settings that describe the formats (e.g., postal addresses) used to describe locations and geography-related
items. (GNU extension, since glibc 2.2)

### LC_TELEPHONE
Rules that describe the formats to be used with telephone services.

### LC_MEASUREMENT
Change the settings relating to the measurement system in the locale (i.e. metric versus imperial units).

### LC_IDENTIFICATION
Change settings that relate to the metadata for the locale. (GNU extension, since glibc 2.2)

### LC__FASTMSG
Specifies that default messages are used for the C and POSIX locales and that NLSPATH are ignored when `LC__FASTMSG` is set to true. Otherwise, POSIX compliant message handling will be performed. The default value will be LC__FASTMSG=true in the /etc/environment file.

### LANGUAGE
Specifying a Priority List of Languages.  
Not all programs have translations for all languages. By default, an English message is shown in place of a nonexistent translation. If you understand other languages, you can set up a priority list of languages. GNU `gettext` gives preference to LANGUAGE over `LC_ALL` and `LANG` for the purpose of message handling, but you still need to have `LANG` (or `LC_ALL`) set to the primary language; this is required by other parts of the system libraries. For example, some Swedish users who would rather read translations in German than English for when Swedish is not available, set LANGUAGE to `sv:de` while leaving LANG to `sv_SE`.  
In the LANGUAGE environment variable, but not in the other environment variables, `language_TERRITORY` combinations can be abbreviated as `language` only to denote the language's main dialect. For example, `de` is equivalent to `de_DE` in this context.  
Note: The variable LANGUAGE is ignored if the locale is set to `C`. In other words, you have to first enable localization, by setting LANG (or LC_ALL) to a value other than `C`, before you can use a language priority list through the LANGUAGE variable. 

### TZ
Timezone information is used by the `ctime()`, `localtime()`, `strftime()` and `mktime()` functions and by various utilities, to override the default timezone.

### LOCPATH
A list of pathnames, separated by colons, that should be used to find locale data. If this variable is set, only the
individual compiled locale data files from LOCPATH and the system default locale data path are used; any available locale archives are not used; see localedef(1). The individual compiled locale data files are searched for under
subdirectories which depend on the currently used locale. For example, when `en_GB.UTF-8` is used for a category, the
following subdirectories are searched for, in this order: `en_GB.UTF-8`, `en_GB.utf8`, `en_GB`, `en.UTF-8`, `en.utf8`, and `en`. Note: all setuid and setgid programs ignore the LOCPATH environment variable.  

### I18NPATH
A colon-separated list of search directories for locale files. Default: `/usr/share/i18n`

### NLSPATH
Specifies the search path for locating message catalog files. This environment variable is used by the Message Facility component of the multicultural support subsystem. See the `catopen` subroutine for more information about expected format of the NLSPATH variable.


---


A locale name has the form: `language[_TERRITORY][.encoding][@modifier]` where language is two-letter language code, territory is two-letter country code, encoding specifies the character encoding and modifier denotes any kind of additional characteristics. Examples: `en_US`, `da_DK.UTF-8`, `sr_RS@latin`, `ja_JP.UTF-8@cjknarrow`.

`C` or `POSIX` is a special locale that disables all localization: all programs standardized by POSIX use English messages and an unspecified character encoding (often US-ASCII, but sometimes also ISO-8859-1 or UTF-8, depending on the OS).

When a POSIX-standardized program looks up locale dependent values, it does this according to the following environment variables, in priority order: `LANGUAGE`, `LC_ALL`, `LC_*`, `LANG`. Variables whose value is null are ignored in this lookup.


> - Check locale information: `locale`.
> - Verify or install new locales: `locale-gen`
> - Modify global locale settings: `update-locale`
> - List of all available locales: https://lh.2xlibre.net/locales/
> - Compare locales (in bash):  
`diff <(LC_ALL=C locale -k LC_CTYPE) <(LC_ALL=C.UTF-8 locale -k LC_CTYPE)`
> - `LC_*` variables are sent and receieved by most `/etc/ssh/ssh*_config`




---

[1]: https://www.ibm.com/support/knowledgecenter/ssw_aix_71/com.ibm.aix.files/LC_COLLATE.htm?view=embed


## Links
- https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html#Locale-Environment-Variables
- https://www.ibm.com/support/knowledgecenter/en/ssw_aix_71/com.ibm.aix.nlsgdrf/understand_locale_environ_var.htm
- https://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do
- https://docs.oracle.com/cd/E23824_01/html/E26033/glmbx.html
- https://perlgeek.de/en/article/set-up-a-clean-utf8-environment
