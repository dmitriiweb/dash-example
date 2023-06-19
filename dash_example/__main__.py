from dash import dcc, html
from dash.dependencies import Input, Output
from dash_example.app import app


app.layout = html.Div(
    [
        dcc.Location(id="url", refresh=False),
        html.Div(id="some-id"),
    ]
)


@app.callback(
    Output("some-id", "children"),
    [Input("url", "pathname")],
)
def display_page(pathname):
    return html.Div(html.H1("Hello World"))


if __name__ == "__main__":
    app.run_server(host="0.0.0.0", port=80, debug=True)
