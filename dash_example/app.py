import dash


app = dash.Dash(
    suppress_callback_exceptions=True
)

server = app.server
