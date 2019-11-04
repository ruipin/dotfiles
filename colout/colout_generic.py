#encoding: utf-8

def theme(context):
    context["colors"]["none"] = 9

    return context,[
        # Fatal
        [ "(?i).*fatal.*", "magenta", "bold"],

        # Error
        [ "(?i).*error.*", "red", "bold" ],

        # Warning
        [ "(?i).*warn.*", "yellow"],

        # Info
        [ "(?i).*info.*", "cyan"],

        # Separator
        [ "\s*[-+#]{3}.*", "blue"],

        # Comment
        #[ ".*([/#]{2}.*)", "10"],
    ]
