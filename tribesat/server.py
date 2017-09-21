""" Main entry point for tribesat backend
"""

from flask import Flask  # type: ignore
app = Flask(__name__)  # pylint: disable=invalid-name


@app.route("/")
def heartbeat() -> str:
    """Heartbeat endpoint for checking if the backend is running

    Returns:
        str: winky face `;)`

    """
    return "hello world"

@app.route("/test_route")
def test_route() -> str:
    return "123"
