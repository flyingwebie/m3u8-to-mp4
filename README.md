# M3U8 to MP4 Video Converter

This project provides a Docker-based solution for converting M3U8 video streams to MP4 files. It uses FFmpeg to perform the conversion and can handle multiple video streams in a single run.

## Description

The converter is built as a Docker container, making it easy to run on various platforms without worrying about dependencies. It takes a list of M3U8 video streams, downloads them, and converts them to MP4 format.

## Prerequisites

- Docker
- Docker Compose (optional, but recommended)

## Setup

1. Clone this repository to your local machine.
2. Edit the `script.sh` file to add your video streams:

```shell:script.sh
startLine: 23
endLine: 27
```

Replace the example URLs with your actual M3U8 stream URLs.

## Usage

### Using Docker Compose (Recommended)

1. Open a terminal and navigate to the project directory.
2. Run the following command:

```
docker-compose up --build
```

### Using Docker directly

1. Build the Docker image:

```
docker build -t m3u8-to-mp4-converter .
```

2. Run the container:

```
docker run -v $(pwd)/output:/app/output m3u8-to-mp4-converter
```

## Platform-specific Instructions

### Windows

1. Install Docker Desktop for Windows.
2. Open PowerShell or Command Prompt.
3. Navigate to the project directory.
4. Run the Docker Compose or Docker commands as described in the Usage section.

### macOS

1. Install Docker Desktop for Mac.
2. Open Terminal.
3. Navigate to the project directory.
4. Run the Docker Compose or Docker commands as described in the Usage section.

### Linux

1. Install Docker and Docker Compose using your distribution's package manager.
2. Open a terminal.
3. Navigate to the project directory.
4. Run the Docker Compose or Docker commands as described in the Usage section.

## Output

Converted MP4 files will be saved in the `output` directory within your project folder.
