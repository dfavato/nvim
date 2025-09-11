import type {Plugin} from "@opencode-ai/plugin"


export const EnvProtectionPlugin: Plugin = async ({app, client, $}) => {
  return {
    "tool.execute.before": async ( input, output ) => {
      const filePath: string = output.args.filePath || "";
      if ((input.tool === "read") && (filePath.includes(".env"))) {
        throw new Error("Access to .env files is not allowed for security reasons.");
      }
    }
  }
};
