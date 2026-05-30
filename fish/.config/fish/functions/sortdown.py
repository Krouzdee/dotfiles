#!/usr/bin/env python3
import os
import shutil

HOME = os.path.expanduser("~")

DOWNLOADS = os.path.join(HOME, "Downloads")
PICTURES = os.path.join(HOME, "Pictures")
DOCUMENTS = os.path.join(HOME, "Documents")
VIDEOS = os.path.join(HOME, "Videos")
MUSIC = os.path.join(HOME, "Music")
ARCHIVES = os.path.join(HOME, "Archives")
TORRENTS = os.path.join(DOWNLOADS, "Torrents")
DEVELOPMENT = os.path.join(HOME, "Development")

EXT_MAP = {
    # Изображения
    'jpg': PICTURES, 'jpeg': PICTURES, 'png': PICTURES, 'webp': PICTURES, 
    'gif': PICTURES, 'svg': PICTURES, 'bmp': PICTURES, 'ico': PICTURES,
    # Документы
    'docx': DOCUMENTS, 'doc': DOCUMENTS, 'xlsx': DOCUMENTS, 'xls': DOCUMENTS, 
    'pptx': DOCUMENTS, 'ppt': DOCUMENTS, 'pdf': DOCUMENTS, 'txt': DOCUMENTS, 
    'md': DOCUMENTS, 'odt': DOCUMENTS, 'rtf': DOCUMENTS, 'csv': DOCUMENTS,
    # Видео
    'mp4': VIDEOS, 'mkv': VIDEOS, 'avi': VIDEOS, 'mov': VIDEOS, 'webm': VIDEOS,
    # Музыка
    'mp3': MUSIC, 'flac': MUSIC, 'wav': MUSIC, 'ogg': MUSIC, 'm4a': MUSIC,
    # Архивы
    'zip': ARCHIVES, 'rar': ARCHIVES, '7z': ARCHIVES, 'tar': ARCHIVES, 
    'gz': ARCHIVES, 'bz2': ARCHIVES, 'xz': ARCHIVES, 'zst': ARCHIVES, 'iso': ARCHIVES,
    # Разработка и код
    'py': DEVELOPMENT, 'cpp': DEVELOPMENT, 'c': DEVELOPMENT, 'h': DEVELOPMENT, 
    'java': DEVELOPMENT, 'js': DEVELOPMENT, 'ts': DEVELOPMENT, 'html': DEVELOPMENT, 
    'css': DEVELOPMENT, 'gd': DEVELOPMENT, 'sh': DEVELOPMENT, 'json': DEVELOPMENT, 'jar': DEVELOPMENT,
    # Торренты
    'torrent': TORRENTS
}

def main():
    if not os.path.exists(DOWNLOADS):
        print(f"Error: Folder {DOWNLOADS} not found!")
        return

    files = [f for f in os.listdir(DOWNLOADS) if os.path.isfile(os.path.join(DOWNLOADS, f))]
    
    if not files:
        print("Folder Downloads is empty!")
        return

    print("Python starting file sorting...")
    moved_count = 0

    for filename in files:
        ext = filename.split('.')[-1].lower() if '.' in filename else ''
        
        if ext in EXT_MAP:
            target_dir = EXT_MAP[ext]
            os.makedirs(target_dir, exist_ok=True)
            
            src_path = os.path.join(DOWNLOADS, filename)
            dest_path = os.path.join(target_dir, filename)
            
            try:
                shutil.move(src_path, dest_path)
                print(f"Moved: {filename} -> {os.path.basename(target_dir)}/")
                moved_count += 1
            except Exception as e:
                print(f"Error moving {filename}: {e}")

    print(f"Sorting finished! Moved files: {moved_count}")

if __name__ == '__main__':
    main()
