function dm --description 'Mount Kepler directories'
    systemctl daemon-reload
    systemctl enable rclone-ether.service
    systemctl enable rclone-onedrive.service
    systemctl start rclone-onedrive.service
    systemctl start rclone-ether.service
end
