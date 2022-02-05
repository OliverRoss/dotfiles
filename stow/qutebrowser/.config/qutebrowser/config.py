# Key bindings:
config.load_autoconfig()
config.bind(',q', 'close')

config.unbind('h')
config.unbind('l')
config.bind(',p', 'tab-prev')
config.bind(',n', 'tab-next')
config.bind('h', 'tab-prev')
config.bind('l', 'tab-next')
config.bind('<Ctrl-k>', 'tab-prev')
config.bind('<Ctrl-j>', 'tab-next')

config.bind('x', 'tab-close')
config.bind(',d', 'tab-close')

config.unbind('D')
config.unbind('d')
config.unbind('u')
config.bind('<d>', 'scroll-px 0 180')
config.bind('<u>', 'scroll-px 0 -180')
config.bind('<Ctrl-u>', 'undo')
config.bind('<Backspace>', 'back')

config.bind(
    ',c', 'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized.css "" ')

# Reduce fingerprinting by setting generic stuff
config.set('content.headers.user_agent',
           'Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0 ')
config.set('content.headers.accept_language', 'en-US,en;q=0.5')
#  config.set('content.headers.custom',
#             '{"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}')
config.set('content.canvas_reading', False)
config.set('content.webgl', False)

# Close with last tab
config.set('tabs.last_close', 'close')

config.set('content.autoplay', False)


# Adblock
#  config.set('content.blocking.enabled', True)

# Cookies
config.set('content.cookies.accept', 'no-3rdparty')
config.set('content.cookies.store', False)

# Private browsing
config.set('content.private_browsing', True)

config.set('tabs.max_width', 200)
config.set('tabs.min_width', 200)
config.set('tabs.indicator.width', 0)
config.set('tabs.favicons.scale', 0.8)
config.set('tabs.show', 'multiple')
config.set('tabs.background', True)

# for only showing tab bar when switching
#  config.set('tabs.show', 'switching')
#  config.set('tabs.show_switching_delay', 1500)
config.set('tabs.padding', {"bottom": 6, "top": 6, "left": 6, "right": 6})
# One tab per window?
config.set('tabs.tabs_are_windows', False)
config.set('tabs.position', 'top')
config.set('tabs.title.format', '{audio}{current_title}')
config.set('tabs.wrap', False)

config.set('messages.timeout', 3000)

# STatusbar
config.set('statusbar.widgets', ["url"])
config.set('statusbar.show', "always")
config.set('statusbar.position', "bottom")
config.set('statusbar.padding', {"bottom": 6, "top": 6, "left": 6, "right": 6})

config.set('completion.height', '20%')


# Downloads
config.set('downloads.location.directory', '~/Downloads')
config.set('downloads.location.prompt', False)
config.set('downloads.location.remember', False)
config.set('downloads.position', 'bottom')
config.set('downloads.remove_finished', -1)

# HInts
config.set('hints.chars', 'asdf')
config.set('hints.radius', 1)


#  config.unbind('.')
#  config.bind('m', '')
# COlors:

# Solarized Dark scheme

base03 = "#002b36"
base02 = "#073642"
base01 = "#586e75"
base00 = "#657b83"
base0 = "#839496"
base1 = "#93a1a1"
base2 = "#eee8d5"
base3 = "#fdf6e3"

red = "#dc322f"
orange = "#cb4b16"
yellow = "#b58900"
green = "#859900"
cyan = "#2aa198"
blue = "#268bd2"
violet = "#6c71c4"
magenta = "#d33682"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base1

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base03

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base03

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = blue

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base03

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base03

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base03

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base1

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base01

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = base01

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base01

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = base1

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = orange

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base1

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base03

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = base02

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = base0

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = base03

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg = base1

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = base01

# Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = base1

# Background color for the download bar.
c.colors.downloads.bar.bg = base03

# Color gradient start for download text.
c.colors.downloads.start.fg = base03

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = blue

# Color gradient end for download text.
c.colors.downloads.stop.fg = base03

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = cyan

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = red

# Font color for hints.
c.colors.hints.fg = base03

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = yellow

# Font color for the matched part of hints.
c.colors.hints.match.fg = base1

# Text color for the keyhint widget.
c.colors.keyhint.fg = base1

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base1

# Background color of the keyhint widget.
c.colors.keyhint.bg = base03

# Foreground color of an error message.
c.colors.messages.error.fg = base03

# Background color of an error message.
c.colors.messages.error.bg = red

# Border color of an error message.
c.colors.messages.error.border = red

# Foreground color of a warning message.
c.colors.messages.warning.fg = base03

# Background color of a warning message.
c.colors.messages.warning.bg = violet

# Border color of a warning message.
c.colors.messages.warning.border = violet

# Foreground color of an info message.
c.colors.messages.info.fg = base1

# Background color of an info message.
c.colors.messages.info.bg = base03

# Border color of an info message.
c.colors.messages.info.border = base03

# Foreground color for prompts.
c.colors.prompts.fg = base1

# Border used around UI elements in prompts.
c.colors.prompts.border = base03

# Background color for prompts.
c.colors.prompts.bg = base03

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base01

# Foreground color for the selected item in filename prompts.
#  c.colors.prompts.selected.fg = base05

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base1

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base03

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = cyan

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = base03

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = yellow

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base03

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = violet

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base03

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base0

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base02

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = violet

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base02

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = blue

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base03

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = blue

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base03

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base03

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base1

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = red

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = orange

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = green

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = green

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = violet

# Background color of the tab bar.
c.colors.tabs.bar.bg = base03

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = blue

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = cyan

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = red

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base1

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base03

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base1

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base03

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = green

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = base03

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = green

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = base03

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = base01

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = base1

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = base01

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = base1

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base1

tab_sel_col = base3
# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = tab_sel_col

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base1

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = tab_sel_col

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.bg = base03
