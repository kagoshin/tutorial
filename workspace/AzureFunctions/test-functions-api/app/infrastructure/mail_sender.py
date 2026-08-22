from typing import Iterable

from app.core.config import Settings
from app.infrastructure.graph_client import GraphClient


class MailSender:
    """Microsoft Graph APIの sendMail エンドポイントを使ったメール送信。"""

    def __init__(self, settings: Settings, graph_client: GraphClient):
        self._settings = settings
        self._graph_client = graph_client

    def send_mail(self, to: Iterable[str], subject: str, body: str) -> None:
        payload = {
            "message": {
                "subject": subject,
                "body": {"contentType": "Text", "content": body},
                "toRecipients": [
                    {"emailAddress": {"address": address}} for address in to
                ],
            },
            "saveToSentItems": "false",
        }
        sender = self._settings.graph_sender_upn
        self._graph_client.post(f"/users/{sender}/sendMail", json=payload)
