from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name="kamigami-no-tatakai",
    version="1.0.0",
    author="作者名",
    author_email="author@example.com",
    description="神々の闘い - ヤハウェと弥勒菩薩のバトルライトノベル",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/kamigami-no-tatakai",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.8",
    install_requires=[
        "mkdocs>=1.5.3",
        "mkdocs-material>=9.4.14",
        "mkdocs-awesome-pages-plugin>=2.9.2",
        "pymdown-extensions>=10.5",
        "mkdocs-minify-plugin>=0.7.2",
    ],
)