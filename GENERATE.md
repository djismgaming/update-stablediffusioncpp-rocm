# Stable Diffusion CLI Command to generate an image

```pwsh
sd-cli --diffusion-model \
F:\ai\huggingface\hub\models--unsloth--Z-Image-Turbo-GGUF\snapshots\6c80814333b7b6a70a2e5b469a7c6437ce65de0f\z-image-turbo-Q4_K_M.gguf \
--vae "F:\ai\stability-matrix\Data\Models\VAE\ae.safetensors" --llm "F:\ai\stability-matrix\Data\Models\TextEncoders\qwen_3_4b.safetensors" \
--cfg-scale 1.0 -v --offload-to-cpu --diffusion-fa -H 1024 -W 1024 --steps 4 \
--prompt  "a latina woman with brown curly hair in a beach at sunset. Superimposed over the image in a sleek, modern, slightly glitched \
font is the philosophical quote: 'THE CITY IS A CIRCUIT BOARD, AND I AM A BROKEN TRANSISTOR.'"
```

This command is using the `sd-cli` tool to generate an image based on a text prompt. Here's a breakdown of the command:

1. `--diffusion-model`: Specifies the path to the diffusion model file (a GGUF format model for Z-Image-Turbo)
2. `--vae`: Specifies the path to the VAE (Variational Autoencoder) model file
3. `--llm`: Specifies the path to the text encoder model file (Qwen3-4B)
4. `-p`: The text prompt describing the image to generate ("a latina woman with brown curly hair in a beach at sunset")

The command appears to be using a combination of different AI models to generate an image from text, with the Z-Image-Turbo diffusion model as the primary generator, supported by the specified VAE and text encoder models.
