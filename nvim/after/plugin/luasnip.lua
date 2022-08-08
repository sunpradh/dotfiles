--
-- Snippets
--
local ls = require('luasnip')

-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Clean snippets table when reloading this file
ls.cleanup()

-- Load snippets
ls.config.set_config({
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
})

-- Helper function for TeX snippets
local asciify = function(args, _)
    return string.gsub(string.lower(args[1][1]), '%W', '_')
end

local cmd_surround = function(_, snip, cmd)
    if (#snip.captures > 1 and snip.captures[2] ~= " ") then
            return "\\" .. cmd .. "{" .. snip.captures[1] .. "}" .. snip.captures[2]
    else
        return "\\" .. cmd .. "{" .. snip.captures[1] .. "}"
    end
end

local frac_surround = function(_, snip)
    return "\\frac{" .. snip.captures[1] .. "}{" .. snip.captures[2] .. "}"
end

local tex_section = function(name, label_prefix)
    return s(label_prefix, {
        t('\\' .. name .. '{'), i(1), t({ '}', '' }),
        t('\\label{' .. label_prefix .. ':'), f(asciify, {1}), i(2), t({ '}', '', '' }),
        i(0)
    })
end

local tex_auto_superscript = function (trig, text)
    return s(
        {trig="%s+" .. trig .. "%s+", regTrig=true, wordTrig=false},
        t("^{" .. text .. "} ")
    )
end

local tex_auto_surround = function(trig, cmd)
    return s(
        {trig=trig .. "%s+(%S+)([ _^$]+)", regTrig=true, wordTrig=true},
        { f(cmd_surround, {}, {user_args = {cmd}})}
        )
end

local tex_partial_frac = function(trig_exp)
    return s(
        {trig=trig_exp, regTrig=true, wordTrig=false},
        { f(cmd_surround, {}, {user_args = {"frac"}}), t("{"), i(1), t("} "), i(0)}
    )
end

local tex_full_frac = function(trig_exp)
    return s(
        {trig=trig_exp, regTrig=true, wordTrig=false},
        { f(frac_surround, {}), t(" ") }
    )
end


ls.add_snippets("tex", {
    -- TeX sectioning
    tex_section("chapter", "chap"),
    tex_section("section", "sec"),
    tex_section("subsection", "sub"),
    tex_section("subsubsection", "ssub"),
    -- TeX fraction
    tex_partial_frac("%(([^%)]+)%)/"),
    tex_partial_frac("(%S+)/"),
    tex_full_frac("%(([^%)]+)%)/(%d+)"),
    tex_full_frac("(%d+)/%(([^%)]+)%)"),
    tex_full_frac("(%S+)/(%d+)"),
}, {key = "tex_snippets"})


ls.add_snippets("tex", {
        s({trig="^^", wordTrig=false}, { t("^{"), i(1), t("}"), i(0) } ),
        s({trig="__", wordTrig=false}, { t("_{"), i(1), t("}"), i(0) } ),
        -- common TeX math superscripts
        tex_auto_superscript("inv",  "-1"),
        tex_auto_superscript("dag", "\\dagger"),
        tex_auto_superscript("ast", "\\ast"),
        tex_auto_superscript("pri", "\\prime"),
        -- TeX accents
        tex_auto_surround('vec', 'vec'),
        tex_auto_surround('til', 'tilde'),
        tex_auto_surround('bar', 'overline'),
        tex_auto_surround('hat', 'hat'),
        -- TeX math fonts
        tex_auto_surround('mcal', 'mathcal'),
        tex_auto_surround('mbb',  'mathbb'),
        tex_auto_surround('mrm',  'mathrm'),
        tex_auto_surround('mbf',  'mathbf'),
        tex_auto_surround('bm',   'bm'),
        tex_auto_surround('msf',  'mathsf'),
        tex_auto_surround('mtt',  'text'),
}, {type = "autosnippets", key = "tex_autosnippets"})

require('luasnip.loaders.from_vscode').lazy_load({ paths = {'./snippets/'} })
