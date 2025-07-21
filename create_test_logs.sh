#!/bin/bash

TARGET_DIR="/var/log/messages-logs"
mkdir -p "$TARGET_DIR"

for day in {11..20}; do
    FILENAME="messages_202507${day}.log"
    touch -d "2025-07-${day} 00:00:00" "$TARGET_DIR/$FILENAME"
    chown root:root "$TARGET_DIR/$FILENAME"
done

ls -ltrh "$TARGET_DIR"

